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
            multihash = Multihashes.encode(content, 'sha2-256')
          when 0x12
            multihash = Multihashes.encode(content, 'sha3-256')
          else
            raise Errors::MultihashUnsupportedHashAlgorithm
          end
          multihash.delete(" ")
        end

        def canonicalized_double_multihash(content)
          canonicalized_content = content.to_json_c14n
          content_buffer = [canonicalized_content].pack("H*")

          multihash_content = multihash(content_buffer, hash_func_type: 0x12)
          
          double_multihash_content = multihash(multihash_content, hash_func_type: 0x12)
          Base64.urlsafe_encode64(double_multihash_content)
        end

        def canonicalized_multihash(content)
          canonicalized_content = content.to_json_c14n
          content_buffer = [canonicalized_content].pack("H*")

          multihash_content = multihash(content_buffer, hash_func_type: 0x12)
          Base64.urlsafe_encode64(multihash_content)
        end

      end
    end
  end
end