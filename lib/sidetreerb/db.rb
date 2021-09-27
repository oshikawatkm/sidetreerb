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


    def add_transaction(transaction)
      db_adapter.add_transaction(transaction)
    end

    private

    def db_adapter
      self.class.db_adapter
    end

  end
end