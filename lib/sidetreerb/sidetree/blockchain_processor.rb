module Sidetreerb
  module Sidetree
    class BlockchainProcessor
      attr_reader :blockchain, :wallet

      class << self
        def get_instance
          self.new
        end
      end

      # Generate Anchor String
      # desc: https://identity.foundation/sidetree/spec/#transaction-anchoring
      # 
      # def generate_anchor_string(
      #     core_index_file:, 
      #     provisional_index_file:,
      #     core_index_file_uri:
      #   )
      #   core_operation_count = core_index_file.count_operations
      #   provisional_operation_count = core_index_file.count_operations
      #   operations_count = core_operation_count + provisional_operation_count

      #   "#{provisional_operation_count}.#{core_index_file_uri}"
      # end

      def process_blocks(start_block_height:)
        latest_block_height = blockchain.get_blockcount
        for block_height in start_block_height..latest_block_height do
          block_hash = blockchain.get_blockhash(block_height)
          process_block(block_hash: block_hash)
        end
      end

      def process_block(block_hash:)
        block = blockchain.get_block(block_hash)
        block.tx.each do |txid|
          process_transaction(txid: txid)
        end
      end

      def process_transaction(txid:)
        transaction = wallet.get_rawtransaction(txid)
        transaction.vout.each do |output|
          script = Bitcoin::Script.new << OP_RETURN << output.scriptPubKey[:hex]
          next unless !script.op_return?

          process_sidetree_transactions(transaction: transaction, output: output)
        end
      end

      def process_sidetree_transaction(transaction:, output:)

      end

      private

      def initialize(blockchain, wallet, db
        @blockchain = blockchain
        @wallet = wallet
        @db = db
      end

    end
  end
end