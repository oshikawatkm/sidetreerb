
module Sidetreerb
  module Sidetree
    class AddPublicKeysPatch
      def initialize(public_keys:)
        @action = PatchType::AddPublicKeys
        @public_keys = []
      end

      def export_json
        {}.to_json
      end

      def add_public_key(pubkey:)
        public_keys.push(pubkey)
      end

      def is_valid?

      end

    end
  end
end