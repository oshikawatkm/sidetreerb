module Sidetreerb
  module Blockchain
    class Bitcoind
      module RPC
        module_function

        def client
          @rpc ||= Bitcoin::RPC::BitcoinCoreClient.new(@config)
        end

        def configure(config)
          @config = config
        end

        def perform_as(wallet)
          before = client.config[:wallet]
          client.config[:wallet] = wallet
          yield(client)
        ensure
          client.config[:wallet] = before
        end

      end
    end
  end
end