module Sidetree
  module Blockchain
    module Bitcoin
      class Wallet

       def client
        @rpc ||= Bitcoin::RPC::BitcoinCoreClient.new(@config)
       end

       def configure(config)
        @config = config
       end


      end
    end
  end
end