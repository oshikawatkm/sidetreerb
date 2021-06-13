module Sidetreerb
  module Sidetree
    class FileManager
      class CoreProofFile

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
            operations: operations
          }.to_json
        end

        def is_valid?

        end
      end
    end
  end
end