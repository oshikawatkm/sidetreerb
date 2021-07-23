require 'base64'
require 'openssl'


module Sidetreerb
  module Sidetree
    module Utils
      class Key
      
        def initialize(id = nil)
          key_pair = OpenSSL::PKey::EC.new('secp256k1').generate_key
          @id = id
          @privkey = key_pair.private_key
          @pubkey = key_pair.public_key
        end

        def generate_commitment
          Sidetreerb::Sidetree::Utils::Hash.canonicalized_double_multihash(@pubkey.to_bn.to_s)
        end

        def to_jwk
          private_binary = @privkey.to_s(2)
          public_binary = @pubkey.to_bn.to_s(2)
          x, y = public_binary.unpack('xa32a32')
          
          {
            crv: 'secp256k1',
            d: Base64.urlsafe_encode64(private_binary, padding: false),
            kty: 'EC',
            x: Base64.urlsafe_encode64(x, padding: false),
            y: Base64.urlsafe_encode64(y, padding: false),
          }
        end

        def sign

        end
      end
    end
  end
end