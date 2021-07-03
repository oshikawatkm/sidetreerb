

module Sidetreerb
  module Sidetree
    class Delta
      attr_reader :update_commitment, :patches

      def initialize(update_commitment:, patches: [])
        @update_commitment = update_commitment
        @patches = patches
      end

      def add_patch(patch:)
        patches.push(patch)
      end

      def list_patches
        patch_list = []
        patches.each do |patch|
          patch_list.push({ action: patch.action, public_keys: patch.public_keys, services: patch.services })
        end
        patch_list
      end

      # [TASK] change hasing method
      def generate_hash
        Sidetreerb::Sidetree::Utils::Hash.canonicalized_multihash({update_commitment: update_commitment, patches: patches}.to_json)
      end

      def export_json
        { update_commitment: update_commitment, patches: list_patches }
      end

    end
  end
end
