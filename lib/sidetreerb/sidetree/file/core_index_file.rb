module Sidetreerb
  module Sidetree
    class FileManager
      class CoreIndexFile

        def initilize(
          core_proof_file_index:,
          provisional_index_file_uri:,
          writer_lock_id:,
          operations: []
        )
          @core_proof_file_index = core_proof_file_index
          @provisional_index_file_uri = provisional_index_file_uri
          @writer_lock_id = writer_lock_id
          @operations = operations
        end

        def add_operation(operation:)
          @operations.push(operation)
        end

        def export_json
          {
            coreProofFileUri: core_proof_file_index,
            provisionalIndexFileUri: provisional_index_file_uri,
            writer_lock_id: writer_lock_id,
            operations: operations
          }.to_json
        end

        def is_valid?

        end
      end
    end
  end
end