module Sidetree
  module Blockchain
    module Bitcoin
      class Wallet < AbstractWallet
        autoload :AbstractWallet, 'sidetreerb/blockchain/abstruct_blockchain/abstruct_wallet'
        
        def sign_tx(tx)

        end

      end
    end
  end
end