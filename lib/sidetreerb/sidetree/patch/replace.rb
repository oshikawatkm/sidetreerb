
module Sidetreerb
  module Sidetree
    class PatchManager
      class ReplacePatch
        attr_reader :action, :public_keys, :services

        def initialize(pubkeys: [], services: [])
          @action = PatchType::REPLACE
          @public_keys = pubkeys
          @services = services
        end

        def list_public_keys
          public_keys_list = []
          @public_keys.each do |public_key|
            public_keys_list.push(public_key)
          end
          public_keys_list
        end

        def list_services
          services_list = []
          @services.each do |service|
            services_list.push({})
          end
          services_list
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