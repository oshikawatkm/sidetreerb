module Sidetree
  module Blockchain
    class Bitcoin
      autoload :TxBuilder, ''

      def create
        new(blockchain_adapter.create_client)        
      end
      
      
    end
  end
end