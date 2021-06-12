

module Sidetreerb
  module Sidetree
    class OperationManager
      class CreateOperation
      
        def initialize(suffix_data:, delta:)
          @type = Sidetreerb::Sidetree::OperationManager::OperationType::CREATE
          @suffix_data = suffix_data
          @delta = delta
        end

        def export_json
          { type: type, suffixData: suffix_data, delta: delta }.to_json
        end

        def is_valid?

        end

        private

      end
    end
  end
end