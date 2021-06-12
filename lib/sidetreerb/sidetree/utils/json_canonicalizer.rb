module Sidetreerb
  module Sidetree
    module Key
      class JsonCanonicalizer
        module_function

        def canonicalize_as_buffer(content)
          canonicalized_content = content.to_json_c14n
          [canonicalized_content].pack("H*")
        end
        
      end
    end
  end
end