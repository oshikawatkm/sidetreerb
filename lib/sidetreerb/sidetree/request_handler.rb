

module Sidetreerb
  module Sidetree
    class RequestHandler

      class << self

        def get_instance
          OperationManager.new()
        end

      end


      def handle_request(request)
        operation = OperationManager.parse(request)
        case(operation.type)
        when Operation::CREATE
          create_operation = CreateOperation.new()
          
        when Operation::UPDATE

        when Operation::RECOVERY

        when Operation::DEACTIVATE

        else
          raise Errors::UnknownOperationType
        end
      end


    end
  end
end