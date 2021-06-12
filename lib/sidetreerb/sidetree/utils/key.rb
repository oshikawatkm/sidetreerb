


module Sidetreerb
  module Sidetree
    module Utils
      class Key
      
        def initialize(id = nil)
          key_pair = Bitcoin::Key.generate
          @id = id
          @pubkey = key_pair.pubkey
          @privkey = key_pair.priv_key
        end

        def generate_commitment
          Sidetreerb::Sidetree::Utils::Hash.double_hash(@pubkey)
        end

        def to_jwk
          
        end

        def sign

        end
      end
    end
  end
end