require 'pry'

module Sidetreerb
  module Sidetree
    class PatchManager
      autoload :AddPublicKeysPatch, 'sidetreerb/sidetree/patch/add_public_keys'
      autoload :IetfJsonPatch, 'sidetreerb/sidetree/patch/ietf_json_patch'
      autoload :PatchType, 'sidetreerb/sidetree/patch/patch_type'
      autoload :RemovePublicKeysPatch, 'sidetreerb/sidetree/patch/remove_public_keys'
      autoload :RemoveServicesPatch, 'sidetreerb/sidetree/patch/remove_services'
      autoload :ReplacePatch, 'sidetreerb/sidetree/patch/replace'
      autoload :Service, 'sidetreerb/sidetree/domain/service'
    
      class << self
        def get_instance
          self.new
        end
      end

      def generate_add_public_keys
        
      end

      def generate_remove_publick_keys

      end

      def generate_remove_services_patch

      end

      def generate_replace_patch(key_pair:)
        service ||= Sidetreerb::Sidetree::Service.new
        Sidetreerb::Sidetree::PatchManager::ReplacePatch.new(pubkeys: [key_pair.to_jwk], services: [service])
      end

      def ietf_json_patch

      end

      def apply_replace_patch(public_keys:, services:)
        ReplacePatch.new(
          public_keys: public_keys,
          services: services
        )
      end

      def apply_add_public_keys_patch(public_keys:)
        AddPublicKeysPatch.new(public_keys: public_keys)
      end

      def apply_remove_public_keys_patch(ids:)
        RemovePublicKeysPatch.new(ids: ids)
      end

      def apply_add_services_patch(public_keys:)

      end

      def apply_remove_services_patch(ids:)
        RemoveServicesPatch.new(ids: ids)
      end

      private
      
      # def def initialize()
      #   @attribute = attribute
      # end
    end
  end
end