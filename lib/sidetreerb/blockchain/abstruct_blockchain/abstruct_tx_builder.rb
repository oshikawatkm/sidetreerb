module Sidetree
  module Blockchain
    class AbstractTxBuilder
      
      def read_tx
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end

      def create_tx
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end

    end
  end
end