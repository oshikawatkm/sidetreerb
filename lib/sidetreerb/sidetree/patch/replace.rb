
module Sidetreerb
  module Sidetree
    class PatchManager
      class ReplacePatch
        def initialize(pubkeys: [], services: [])
          @action = PatchType::REPLACE
          @public_keys = pubkeys
          @services = services
        end

        def export_json
          { publicKeys: public_keys, services: services }.to_json
        end
        
        def is_valid?

        end
      end
    end
  end
end