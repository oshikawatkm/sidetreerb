
module Sidetreerb
  module Sidetree
    class DBManager

      def initialize(db_adapter:)
        @db = db_adapter
      end


      def enque_create_operation(create_operation)
        db.create(did_suffix: create_operation.did_suffix, opreration_buffer: create_operation.pack('H*'))
      end
  
      def deque_create_operations()
        db.find()
      end

    end
  end
end