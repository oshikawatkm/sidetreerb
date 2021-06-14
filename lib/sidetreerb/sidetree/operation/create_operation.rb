

module Sidetreerb
  module Sidetree
    class OperationManager
      class CreateOperation
        attr_reader :suffix_data

        def initialize(suffix_data:, delta:)
          @type = Sidetreerb::Sidetree::OperationManager::OperationType::CREATE
          @suffix_data = suffix_data
          @delta = delta
        end

        def export_json
          { type: @type, suffixData: @suffix_data, delta: { update_commitment: @delta.update_commitment, patches: @delta.list_patches } }
        end

        def is_valid?

        end

        def generate_files
          
        end

        private

      end
    end
  end
end