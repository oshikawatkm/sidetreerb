module Sidetreerb
  module Sidetree
    class FileManager
      class CoreIndexFile
        attr_reader :core_proof_file_index, :provisional_index_file_uri, :writer_lock_id,
        :create_operations

        def initialize(
          core_proof_file_index:,
          provisional_index_file_uri:,
          writer_lock_id:,
          create_operations: []
        )
          @core_proof_file_index = core_proof_file_index
          @provisional_index_file_uri = provisional_index_file_uri
          @writer_lock_id = writer_lock_id
          @create_operations = create_operations
        end

        def export_json
          {
            coreProofFileUri: core_proof_file_index,
            provisionalIndexFileUri: provisional_index_file_uri,
            writer_lock_id: writer_lock_id,
            operations: {
              create: list_creates,
              recover: list_recovers,
              deactivate: list_deactivates
            }
          }.to_json
        end

        def is_valid?

        end

        def count_operations

        end

        private

        def list_creates
          create_operations.map do |operation|
            { 
              type: operation.type, 
              deltaHash: operation.delta_hash, 
              recoveryCommitment: operation.recovery_commitment
            }
          end
        end

        def list_recovers
          recover_operations.map do |operation|
            { 
              type: operation.type, 
              revealValue: operation.reveal_value
            }
          end
        end

        def list_deactivates
          deactivate_operations.map do |operation|
            { 
              type: operation.type, 
              revealValue: operation.reveal_value
            }
          end
        end

      end
    end
  end
end