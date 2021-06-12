

module Sidetreerb
  module Sidetree
    class Delta

      def initialize(update_commitment:, patches: [])
        @update_commitment = update_commitment
        @patches = patches
      end

      def add_patch(patch:)
        patches.push(patch)
      end

      # [TASK] change hasing method
      def generate_hash
        Sidetreerb::Sidetree::Utils::Hash.hash({update_commitment: @update_commitment, patches: @patches}.to_json)
      end

    end
  end
end
