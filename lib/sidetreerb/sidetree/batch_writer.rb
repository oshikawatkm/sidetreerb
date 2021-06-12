

module Sidetreerb
  module Sidetree
    class BatchWrite

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
          anchor_string = blockchain_processor.generate_anchor_string(create_operation)
          files = create_operation.generate_files
          tx = blockchain_processor.build_tx(anchor_string)

          cas_processor.upload(files)
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

    end
  end
end