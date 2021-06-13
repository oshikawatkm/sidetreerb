

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
          handle_create_operation(request: request)
        when OperationType::UPDATE
          handle_update_operation(request: request)
        when OperationType::RECOVERY
          handle_recovery_operation(request: request)
        when OperationType::DEACTIVATE
          handle_deactive_operation(request: request)
        else
          raise Sidetreerb::Sidetree::Errors::UnknownOperationType
        end
      end

      private

      def initialize
        @file_manager = FileManager.get_instance
      end

      def handle_create_operation(request:)
        create_operation = OperationManager.apply_create_operation(
          suffix_data: request[:suffixData], 
          delta: request[:delta]
        )
        did = Did.new()
        files = file_manager.generate_new_files()
      end


      def handle_update_operation(request:)
        update_operation = OperationManager.apply_update_operation(
          suffix_data: request[:suffixData], 
          reveal_value: request[:revealValue], 
          delta: request[:delta], 
          signed_data: request[:signedData]
        )
      end

      def handle_recovery_operation(request:)

      end

      def handle_deactive_operation(request:)

      end

    end
  end
end