


module Sidetreerb
  module Sidetree 
    module Utils
      module Hash
        module_function

        def hash(content)
          content
        end

        def multihash(content:, hash_func_type:)
          case (hash_func_type)
          when 18
            
          when 22

          else
            raise Errors::MultihashUnsupportedHashAlgorithm
          end
            
        end

        def double_hash(pubkey)
          pubkey
        end

        def multi_hash

        end
      end
    end
  end
end