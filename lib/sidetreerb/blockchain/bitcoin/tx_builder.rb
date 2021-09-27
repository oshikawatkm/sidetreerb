module Sidetreerb
  module Blockchain
    class Bitcoin
      module TxBuilder

        def build_tx(anchor_string: anchor_string, fee: fee)
          tx = Bitcoin::Tx.new
          utxos = wallet.list_unspent(true)
          dust = 600
          sum, outputs = collect_outputs(utxos)
          fill_input(tx, outputs)

          op_return_script = Bitcoin::Script.new << OP_RETURN << anchor_string

          tx.outputs << Tapyrus::TxOut.new(value: amount, script_pubkey: op_return_script)
          fill_change_btc(tx, sender, sum - fee - dust)

          tx = sender.internal_wallet.sign_tx(tx)
        end

        private 

        def collect_outputs(utxos)
          utxos.inject([0, []]) do |sum, output|
  
            new_sum = sum[0] + output[:amount]
            new_outputs = sum[1] << output
            return [new_sum, new_outputs] if new_sum >= amount
  
            [new_sum, new_outputs]
          end
        end

        def fill_change_btc()

        end

      end
    end
  end
end