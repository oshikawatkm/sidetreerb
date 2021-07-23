module Sidetreerb
  module Blockchain
    class Bitcoind
      class Wallet 
        # autoload :AbstractWallet, 'sidetreerb/blockchain/abstruct_blockchain/abstruct_wallet'

        attr_reader :wallet_name

        def initialize(config)
          Sidetreerb::Blockchain::Bitcoind::RPC.configure(config)
          @wallet_name = config[:walelt_name]
        end
        
        def sign_tx(tx, prevtxs = [], sighashtype: Bitcoin::SIGHASH_TYPE[:all])
          perform_as(wallet_name) do |client|
            res = client.signrawtransactionwithwallet(tx.to_hex, prevtxs, encode_sighashtype(sighashtype))
            if res['complete']
              Bitcoin::Tx.parse_from_payload(res['hex'].htb)
            else
              raise res['errors'].to_json
            end
          end
        end

        def get_new_address
          perform_as(wallet_name) do |client|
            client.getnewaddress
          end
        end

        def list_unspent
          perform_as(wallet_name) do | client |
            res = client.listunspent

            res.map do |i|
              {
                txid: i['txid'],
                vout: i['vout'],
                script_pubkey: i['scriptPubKey'],
                amount: i['amount'],
                finalized: i['confirmations'] != 0
              }
            end
          end
        end

        def create_pubkey
          Sidetreerb::Blockchain::Bitcoind::RPC.client.createpubkey(wallet_name)
        end

        def perform_as(wallet)
          Sidetreerb::Blockchain::Bitcoind::RPC.perform_as(wallet) do |client|
            begin
              yield(client)
            rescue Sidetreerb::Blockchain::Bitcoind::RPC::Error => ex
              if ex.rpc_error['code'] == RPC_WALLET_NOT_FOUND_ERROR_CODE
                raise Errors::WalletUnloaded, "The wallet #{wallet_name} is unloaded. You should load before use it."
              else
                raise ex
              end
            end
          end
        end

      end
    end
  end
end