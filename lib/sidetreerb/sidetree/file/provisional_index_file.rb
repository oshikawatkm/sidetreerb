module Sidetreerb
  module Sidetree
    class FileManager
      class ProvisionalIndexFile
        attr_reader :provisional_proof_file_uri, :chunks, :operations

        def initilize(
          provisional_proof_file_uri:,
          chunks: [],
          operations: []
        )
          @provisional_proof_file_uri = provisional_proof_file_uri
          @chunks = chunks
          @operations = operations
        end

        def add_chunk(chunk:)
          chunks.push(chunk)
        end

        def add_operation(operation:)
          operations.push(operation)
        end

        def export_json
          chunks_array  = chunks_to_array
          {
            provisionalProofFileUri: provisional_proof_file_uri, 
            chunks: chunks_to_array,
            operations: operations_to_array
          }.to_json
        end

        def is_valid?

        end

        private

        def chunks_to_array
          chunks.map { |chunk| { chunkFileUri: chunk.cas_uri } }
        end

        def operations_to_array
          operations.map do |operations|
            
          end
        end
      end
    end
  end
end