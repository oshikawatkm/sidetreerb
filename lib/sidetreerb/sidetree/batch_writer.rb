

module Sidetreerb
  module Sidetree
    class BatchWrite
      attr_reader :db, :cas_processor, :blockchain_processor

      class << self
        def get_instance(db, blockchain, cas)
          self.new(db, blockchain, cas)
        end
      end

      def write
        process_create_operations
        process_update_operations
        process_recover_operations
        process_deactive_operations
      end

      private

      def initilize(db, blockchain, cas)
        @db = db
        @cas_processor = cas
        @blockchain_processor = BlockchainProcessor.get_instance
      end

      def process_create_operations
        create_operations = db.get_qued_create_operations
        create_operations.each do |create_operation| 
          
          core_proof_file = file_manager.generate_core_proof_file(create_operation)
          core_proof_file_uri = cas_processor.upload(core_proof_file)

          provisional_index_file = file_manager.generate_provisional_index_file(
            create_operations: [create_operation]
          )
          as_processor.upload(provisional_index_file)

          core_index_file = file_manager.generate_core_index_file(
            core_proof_file_uri: core_proof_file_uri,
            provisional_index_file_uri: provisional_index_file_uri,
            create_operations: [create_operation]
          )
          core_index_file_uri = cas_processor.upload(core_index_file)

          anchor_string = blockchain_processor.generate_anchor_string(
            core_index_file: core_index_file, 
            provisional_index_file: provisional_index_file,
            core_index_file_uri: core_index_file_uri
          )
          tx = blockchain_processor.build_tx(anchor_string)

          blockchain_processor.broadcast(tx)
        end
      end

      def process_update_operations
        update_operations = db.get_qued_update_operations
        update_operations.each do |update_operation|
          anchor_string = blockchain_processor.generate_anchor_string(update_operation)
        end
      end

      def process_recover_operations
        recover_operations = db.get_qued_recover_operations
        recover_operations.each do |create_operation|
          anchor_string = blockchain_processor.recover_anchor_string(create_operation)
        end
      end

      def process_deactive_operations
        deactive_operations = db.get_qued_deactive_operations
        deactive_operations.each do |deactive_operation|
          anchor_string = blockchain_processor.generate_anchor_string(deactive_operation)
        end
      end

      def process_core_index_file(operations:)

        file_manager.generate_new_files(operations)
      end

      def process_chunk_file(operations:)
        deltas = operations.map {|operation| deltas.export_json }
        chunk_file = ChunkFile.new(deltas: deltas)
        cas.write(chunk_file)
      end
      
    end
  end
end