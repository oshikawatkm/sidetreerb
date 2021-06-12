module Sidetree
  module Blockchain
    class Bitcoin < AbstractBlockchain

      def create
        new(blockchain_adapter.create_client)        
      end
      
      
    end
  end
end