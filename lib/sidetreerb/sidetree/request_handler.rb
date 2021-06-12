

module Sidetreerb
  module Sidetree
    class RequestHandler

      class << self

        def get_instance
          self.new
        end

      end


      def handle_request(request)
        case(request[:type])
        when OperationType::CREATE
          create_operation = OperationManager.apply_create_operation(
            suffix_data: request[:suffixData], 
            delta: request[:delta]
          )
          did = Did.new()
          files = file_manager.generate_new_files()
        when OperationType::UPDATE
          update_operation = OperationManager.apply_update_operation(
            suffix_data: request[:suffixData], 
            reveal_value: request[:revealValue], 
            delta: request[:delta], 
            signed_data: request[:signedData]
          )
        when OperationType::RECOVERY

        when OperationType::DEACTIVATE

        else
          raise Sidetreerb::Sidetree::Errors::UnknownOperationType
        end
      end

      private

      def initialize
        @file_manager = FileManager.get_instance
      end

    end
  end
end