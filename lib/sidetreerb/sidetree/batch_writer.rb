

module Sidetreerb
  module Sidetree
    class BatchWrite

      class << self

        def get_instance(db, blockchain, cas)
          self.new(db, blockchain, cas)
        end

      end

      def write
        create_operations = db.load_qued_create_operations
        update_operations = db.load_qued_update_operations
        recover_operations = db.load_qued_recover_operations
        deactive_operations = db.load_qued_deactive_operations
        
        # create_operations.each do |create_operation|
        #   files = create_operation.generate_files
        #   tx = create_operation.generation_anchor_string
        #   cas.write(files)
        #   blockchain.write(tx)
        # end
      end

      private

      def initilize(db, blockchain, cas)
        @db = db
        @blockchain = blockchain
        @cas = cas
      end

    end
  end
end