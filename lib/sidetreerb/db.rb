module Sidetreerb
  class DB
    autoload :Mongo, 'sidetreerb/db/mongo'
    autoload :Mysql, 'sidetreerb/db/mysql'

    class << self 
      attr_writer :db_adapter

      def configure(config)
        case config[:db][:type]
        when 'mongo'
          Sidetreerb::DB.db_adapter = Sidetreerb::DB::Mongo.new
        when 'mysql'
          Sidetreerb::DB.db_adapter = Sidetreerb::DB::Mysql.new
        else
          raise Error::DB::NotImplemnted
        end
      end

    end

    def add_to_que_create_operation(create_operation)
      wallet_adapter.add_to_que_create_operation
    end

    def load_qued_create_operations
      wallet_adapter.load_qued_create_operations(create_operation)
    end

    private

    def wallet_adapter
      self.class.wallet_adapter
    end

  end
end