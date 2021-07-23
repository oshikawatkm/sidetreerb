

module Sidetreerb
  module Sidetree
    class SidetreeTransaction
      attr_reader: :hex, :transaction

      def initilize(hex)
        @transaction = Bitcoin::Tx.parse_from_payload(hex.htb)
      end

      def get_writer

      end

      def get_sidetree_data
        transaction.out.each do |output|
          script = Tapyrus::Script.parse_from_payload(output.script_pubkey)
          next unless script.op_return?

          op_return_data = script.chunks[2].bth
        end
      end

      def sidetree_transaction?(transaction_arg = nil)
        transaction_arg ||= transaction
        
      end

      private

      def valid_transaction_input_length?
        if transaction.input.lenght < 1
          raise Sidetreerb::Errors::Sidetree::InvalidSidetreeTx, 'here must be at least one input in the transaction id: #{transaction.txid}'
        end
      end

    end
  end
end
