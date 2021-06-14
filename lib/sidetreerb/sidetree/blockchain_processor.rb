module Sidetreerb
  module Sidetree
    class BlockchainProcessor

      class << self
        def get_instance
          self.new
        end
      end

      def generate_anchor_string(create_operation)

      end

      def build_tx(anchor_string)
        blockchain.build_tx(anchor_string)
      end

      def broadcast(tx)
        blockchain.broadcast(tx)
      end

      private

      def initialize(blockchain)
        @blockchain = blockchain
      end

    end
  end
end