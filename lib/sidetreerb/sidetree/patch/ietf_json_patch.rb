
module Sidetreerb
  module Sidetree
    class IetfJsonPatch
      def initialize(public_keys:)
        @action = PatchType::IETF_JSON_PATCH
        @public_keys = []
      end

      def export_json
        JSON.generate({})
      end

      def add_public_key(pubkey:)
        public_keys.push(pubkey)
      end

      def is_valid?

      end

    end
  end
end