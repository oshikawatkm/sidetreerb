require 'pry'
module Sidetreerb
  module Blockchain
    autoload :Bitcoind, 'sidetreerb/blockchain/bitcoin'
    module_function

    class << self
        
      def configure(config)
        case config[:blockchain][:type]
        when 'bitcoin'
          bitcoind = Sidetreerb::Blockchain::Bitcoind.new(config[:blockchain])
          blockchain_adapter = bitcoind.client
          wallet_adapter = bitcoind.wallet
        when 'litecoin'
          raise 'implementing...'
        else
          raise Sidetreerb::Errors::Blockchain::NotImplemnted
        end
      end

      def blockchain_adapter=(adapter)
        @blockchain_adapter = adapter
      end

      def wallet_adapter=(adapter)
        @wallet_adapter = adapter
      end

    end

    def get_blockchain_info
      blockchain_adapter.get_blockchain_info
    end

    def broadcast(tx)
      blockchain_adapter.broadcast(tx)
    end

    def listwallets
      blockchain_adapter.listwallets
    end

    def get_blockcount
      blockchain_adapter.getblockcount
    end

    def get_blockhash(height)
      blockchain_adapter.getblockhash(height)
    end

    def get_block(blockhash)
      blockchain_adapter.getblock(blockhash)
    end

    def get_transaction(txid)
      blockchain_adapter.gettransaction(txid)
    end

    def build_tx(anchor_string)
      wallet_adapter.build_tx(anchor_string)
    end

    def create_pubkey 
      wallet_adapter.create_pubkey
    end

    def get_new_address 
      wallet_adapter.get_new_address
    end

    def list_unspent
      wallet_adapter.list_unspent
    end

    private

    def blockchain_adapter
      self.class.blockchain_adapter
    end

    def wallet_adapter
      self.class.wallet_adapter
    end

  end
end