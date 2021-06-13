module Sidetreerb
  module Sidetree
    class OperationManager
      autoload :CreateOperation, 'sidetreerb/sidetree/operation/create_operation'
      autoload :OperationType, 'sidetreerb/sidetree/operation/operation_type'

      class << self
        def get_instance
          self.new
        end
      end

      def generate_new_create_operation
        recover_key_pair = Sidetreerb::Sidetree::Utils::Key.new
        update_key_pair = Sidetreerb::Sidetree::Utils::Key.new

        # generate patch
        patch = @patch_manager.generate_replace_patch(key_pair: update_key_pair)
        
        delta = Sidetreerb::Sidetree::Delta.new(update_commitment: update_key_pair.generate_commitment, patches: [patch])
        suffix_data = self.generate_suffix_data(recover_commitment: recover_key_pair.generate_commitment, delta_hash: delta.generate_hash)
        a = Sidetreerb::Sidetree::OperationManager::CreateOperation.new(suffix_data: suffix_data, delta: delta)
      end

      def generate_new_update_operation
        UpdateOperation.new()
      end

      def generate_new_recover_operation
        RecoverOperation.new()
      end

      def generate_new_deactive_operation
        DeactiveOperation.new()
      end

      def apply_create_operation(suffix_data:, delta:)
        delta = apply_delta(delta: delta)
        Sidetreerb::Sidetree::OperationManager::CreateOperation.new(
          suffix_data: suffix_data,
          delta: delta
        )
      end

      def apply_update_operation(suffix_data:, reveal_value:, delta:, signed_data:)
        Sidetreerb::Sidetree::OperationManager::UpdateOperation.new(
          suffix_data: suffix_data,
          reveal_value: reveal_value, 
          delta: delta, 
          signed_data: signed_data
        )
      end

      private

      def initialize()
        @patch_manager = PatchManager.new
        @batch_writer = BatchWrite.new
      end

      def generate_suffix_data(recover_commitment:, delta_hash:)
        { hoge: "hoge" }
      end

    end
  end
end