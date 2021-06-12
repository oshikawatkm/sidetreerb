module Sidetree
  module Blockchain
    class AbstractWallet

      def create_wallet
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end

    end
  end
end