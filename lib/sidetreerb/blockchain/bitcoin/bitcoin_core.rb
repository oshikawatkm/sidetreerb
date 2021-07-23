module Sidetreerb
  module Blockchain
    class Bitcoind
      class BitcoinCore

        def initialize(config)
          Sidetreerb::Blockchain::Bitcoind::RPC.configure(config)
        end
        
        def create_wallet
          Sidetreerb::Blockchain::Bitcoind::RPC.client.createwallet
        end

        def broadcast(tx)
          Sidetreerb::Blockchain::Bitcoind::RPC.client.sendrawtransaction(tx.to_hex)
        end

        def get_blockchain_info
          Sidetreerb::Blockchain::Bitcoind::RPC.client.getblockchaininfo
        end

        def listwallets
          Sidetreerb::Blockchain::Bitcoind::RPC.client.listwallets
        end

        def load_wallet
          Sidetreerb::Blockchain::Bitcoind::RPC.client.load_wallet
        end

        def unload_wallet
          Sidetreerb::Blockchain::Bitcoind::RPC.client.unload_wallet
        end

        def balance 
          Sidetreerb::Blockchain::Bitcoind::RPC.client.blockchain
        end

        def receive_address
          Sidetreerb::Blockchain::Bitcoind::RPC.client.receive_address
        end

        def create_pubkey
          Sidetreerb::Blockchain::Bitcoind::RPC.client.create_pubkey
        end

        def getblockcount
          Sidetreerb::Blockchain::Bitcoind::RPC.client.getblockcount
        end

        def getblockhash(height)
          Sidetreerb::Blockchain::Bitcoind::RPC.client.getblockhash(height)
        end

        def getblock(blockhash)
          Sidetreerb::Blockchain::Bitcoind::RPC.client.getblock(blockhash)
        end

        def gettransaction(txid)
          Sidetreerb::Blockchain::Bitcoind::RPC.client.gettransaction(txid)
        end

      end
    end
  end
end