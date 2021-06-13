

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

      def generate_new_files(create_operation:)
        create_operation
        []
      end

    end
  end
end