module Sidetreerb
  module Sidetree
    class JsonCanonicalizer
      module_function

      def canonicalize_as_buffer(content)
        canonicalized_content = content.to_json_c14n
        [canonicalized_content].pack("H*")
      end

    end
  end
end