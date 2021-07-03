module Sidetree
  module Blockchain
    module Bitcoin
      module TxBuilder

        def build_tx(anchor_string: anchor_string, fee: fee)
          tx = Bitcoin::Tx.new
          utxos = wallet.list_unspent(true)
          sum, outputs = collect_outputs(utxos)
          fill_input(tx, outputs)

          fill_change_tpc(tx, sender, sum - fee - amount)

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

      end
    end
  end
end