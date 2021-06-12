
module Sidetreerb
  module Sidetree
    class RemoveServicesPatch
      def initialize(ids:)
        @action = PatchType::REMOVE_SERVICES
        @ids = ids
      end

      def export_json
        JSON.generate({})
      end
      
      def is_valid?

      end

    end
  end
end