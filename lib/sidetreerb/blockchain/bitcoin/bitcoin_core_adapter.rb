module Sidetree
  module Blockchain
    module AR
      class BitcoinCoreAdapter
        
        attr_reader :config
        
        def create_wallet
          RPC.client.createwallet
        end

        def broadcast(tx)
          RPC.client.sendrawtransaction(tx.to_hex)
        end

        def getnewaddress(tx)
          RPC.client.getnewaddress
        end

        def listwallets
          RPC.client.listwallets
        end

        def load_wallet
          RPC.client.load_wallet
        end

        def unload_wallet
          RPC.client.unload_wallet
        end

        def balance 
          RPC.client.blockchain
        end

        def receive_address
          RPC.client.receive_address
        end

        def create_pubkey
          RPC.client.create_pubkey
        end

      end
    end
  end
end