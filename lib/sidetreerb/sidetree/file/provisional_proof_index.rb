module Sidetreerb
  module Sidetree
    class FileManager
      class ProvisionalProofFile

        def initilize(
          operations: []
        )
          @operations = operations
        end

        def add_operation(operation:)
          @operations.push(operation)
        end

        def export_json
          {
            operations: operations_to_array
          }.to_json
        end

        def is_valid?

        end

        private

        def operations_to_array
          @operations.map do |operations|

          end
        end
      end
    end
  end
end