module Sidetree
  module Blockchain
    class AbstractBlockchain

      def create_wallet
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end
      
      def broadcast 
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end


      def getnewaddress(tx)
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end

      def listwallets
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end

      def load_wallet
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end

      def unload_wallet
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end

      def balance 
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end

      def receive_address
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end

      def create_pubkey
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end
    end
  end
end