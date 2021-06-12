


module Sidetreerb
  module Sidetree
    class Key
    
      def initialize(id:, pubkey:, privkey:)
        @id = id
        @pubkey = pubkey
        @privkey = privkey
      end

      def generate_commitment
        Hash.double_hash(pubkey)
      end

      def to_jwk
        
      end

      def sign

      end

    end
  end
end