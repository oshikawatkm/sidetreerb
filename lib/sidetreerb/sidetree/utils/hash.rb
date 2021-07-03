require 'json/canonicalization'
require 'multihashes'

module Sidetreerb
  module Sidetree 
    module Utils
      module Hash
        include JSON::Canonicalization
        module_function

        def hash(content)
          content
        end

        def multihash(content, hash_func_type:)
          case (hash_func_type)
          when 0x12
            hash_content = Multihashes.encode(content, 'sha2-256')
          when 0x16
            Multihashes.encode(content, 'sha3-256')
          else
            raise Errors::MultihashUnsupportedHashAlgorithm
          end
        end

        def double_hash(content)
          content
        end

        def canonicalized_multihash(content)
          canonicalized_content = content.to_json_c14n
          content_buffer = [canonicalized_content].pack("H*")

          multihash = multihash(content_buffer, hash_func_type: 0x12)
          Base64.urlsafe_encode64(multihash)
        end

      end
    end
  end
end