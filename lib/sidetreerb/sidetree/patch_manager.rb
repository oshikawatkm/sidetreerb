

module Sidetreerb
  module Sidetree
    class PatchManager
      autoload :AddPublicKeysPatch, 'sidetreerb/sidetreerb/lib/sidetreerb/sidetree/patch/add_public_keys'
      autoload :IetfJsonPatch, 'sidetreerb/sidetreerb/lib/sidetreerb/sidetree/patch/ietf_json_patch'
      autoload :PatchType, 'sidetreerb/sidetreerb/lib/sidetreerb/sidetree/patch/patch_type'
      autoload :RemovePublicKeysPatch, 'sidetreerb/sidetreerb/lib/sidetreerb/sidetree/patch/remove_public_keys'
      autoload :RemoveServicesPatch, 'sidetreerb/sidetreerb/lib/sidetreerb/sidetree/patch/remove_services'
      autoload :ReplacePatch, 'sidetreerb/sidetreerb/lib/sidetreerb/sidetree/patch/replace'
      autoload :Service, 'sidetreerb/sidetreerb/lib/sidetreerb/sidetree/domain/service'
    
      class << slef

        def get_instance
          OperationManager.new
        end

      end

      def generate_add_public_keys
        
      end

      def generate_remove_publick_keys

      end

      def generate_remove_services_patch

      end

      def generate_replace_patch(key_pair:, services = nil)
        services ||= Service.new
        ReplacePatch.new(pubkeys: [key_pair.to_jwk], services: [services])
      end

      def ietf_json_patch

      end

      private
      
      def def initialize()
        @attribute = attribute
      end
    end
  end
end