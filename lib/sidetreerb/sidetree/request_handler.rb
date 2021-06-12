

module Sidetreerb
  module Sidetree
    class RequestHandler

      class << slef

        def get_instance
          OperationManager.new()
        end

      end


      def handle_request(request)
        operation = OperationManager.parse(request)
        when(operation.type)
        case Operation::CREATE
          create_operation = CreateOperation.new()
          
        case Operation::UPDATE

        case Operation::RECOVERY

        case Operation::DEACTIVATE

        else
          raise Errors::UnknownOperationType
        end
      end


    end
  end
end