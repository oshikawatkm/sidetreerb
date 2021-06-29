

module Sidetreerb
  module Sidetree
    class FileManager
      autoload :ChunkFile, 'sidetreerb/sidetree/file/chunk_file'
      autoload :CoreIndexFile, 'sidetreerb/sidetree/file/core_index_file'
      autoload :CoreProofFile, 'sidetreerb/sidetree/file/core_proof_file'
      autoload :ProvisionalIndexFile, 'sidetreerb/sidetree/file/provisional_index_file'
      autoload :ProvisionalProofFile, 'sidetreerb/sidetree/file/provisional_proof_file'

      class << self
        def get_instance
          self.new
        end
      end
      

      def generate_core_index_file(
            core_proof_file_index:, 
            provisional_index_file_uri:,
            writer_lock_id:,
            create_operations:
          )
        CoreIndexFile.new(
          core_proof_file_index: core_proof_file_index,
          provisional_index_file_uri: provisional_index_file_uri,
          writer_lock_id: writer_lock_id,
          create_operations: create_operations
        )
      end

      def generate_core_proof_file(create_operations:)
        CoreProofFile.new(operations: operations)
      end

    end
  end
end