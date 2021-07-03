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
      def generate_anchor_string(
          core_index_file:, 
          provisional_index_file:,
          core_index_file_uri:
        )
        core_operation_count = core_index_file.count_operations
        provisional_operation_count = core_index_file.count_operations
        operations_count = core_operation_count + provisional_operation_count

        "#{provisional_operation_count}.#{core_index_file_uri}"
      end

      def build_tx(anchor_string)
        blockchain.build_tx(anchor_string)
      end

      def broadcast(tx)
        blockchain.broadcast(tx)
      end

      private

      def initialize(blockchain, wallet)
        @blockchain = blockchain
        @wallet = wallet
      end

    end
  end
end