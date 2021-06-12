
module Sidetreerb
  module Sidetree
    class RemovePublicKeysPatch
      def initialize(ids:)
        @action = PatchType::REMOVE_PUBLIC_KEYS
        @ids = ids
      end

      def export_json
        {}.to_json
      end
      
      def is_valid?

      end

    end
  end
end