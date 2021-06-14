require 'pry'

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
        when Sidetreerb::Sidetree::OperationManager::OperationType::CREATE
          handle_create_operation(request: request)
        when Sidetreerb::Sidetree::OperationManager::OperationType::UPDATE
          handle_update_operation(request: request)
        when Sidetreerb::Sidetree::OperationManager::OperationType::RECOVERY
          handle_recovery_operation(request: request)
        when Sidetreerb::Sidetree::OperationManager::OperationType::DEACTIVATE
          handle_deactive_operation(request: request)
        else
          raise Sidetreerb::Sidetree::Errors::UnknownOperationType
        end
      end

      private

      def initialize
        @file_manager = FileManager.get_instance
        @operation_manager = OperationManager.get_instance
        @patch_manager = PatchManager.get_instance
      end

      def handle_create_operation(request:)
        create_operation = @operation_manager.apply_create_operation(
          suffix_data: request[:suffixData], 
          delta: handle_delta(request_delta: request[:delta])
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

      def handle_delta(request_delta:)
        Delta.new(
          update_commitment: request_delta[:update_commitment],
          patches: handle_patch(request_patches: request_delta[:patches])
        )
      end

      def handle_patch(request_patches:)
        request_patches.map do |request_patch|
          apply_patches(request_patch: request_patch)
        end
      end

      def apply_patches(request_patch:)
        case request_patch[:action]
        when Sidetreerb::Sidetree::PatchManager::PatchType::REPLACE
          @patch_manager.apply_replace_patch(
            public_keys: request_patch[:public_keys], 
            services: request_patch[:services]
          )
        when Sidetreerb::Sidetree::PatchManager::PatchType::ADD_PUBLICK_KEYS
          @patch_manager.apply_add_public_keys_patch(patch: request_patch)
        when Sidetreerb::Sidetree::PatchManager::PatchType::REMOVE_PUBLIC_KEYS
          @patch_manager.apply_remove_public_keys_patch(patch: request_patch)
        when Sidetreerb::Sidetree::PatchManager::PatchType::ADD_SERVICES
          @patch_manager.apply_add_services_patch(patch: request_patch)
        when Sidetreerb::Sidetree::PatchManager::PatchType::REMOVE_SERVICES
          @patch_manager.apply_remove_services_patch(patch: request_patch)
        else
          Errors::UnknownPatchType
        end
      end

    end
  end
end