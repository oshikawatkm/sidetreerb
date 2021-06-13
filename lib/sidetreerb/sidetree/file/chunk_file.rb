module Sidetreerb
  module Sidetree
    class FileManager
      class ChunkFile

        def initilize(
          deltas: []
        )
          @deltas = deltas
        end

        def add_operation(deltas:)
          @deltas.push(deltas)
        end

        def export_json
          {
            deltas: deltas
          }.to_json
        end

        def is_valid?

        end
      end
    end
  end
end