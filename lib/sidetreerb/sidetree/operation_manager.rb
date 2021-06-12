require 'pry'

module Sidetreerb
  module Sidetree
    class OperationManager
      autoload :CreateOperation, 'sidetreerb/sidetree/operation/create_operation'
      autoload :OperationType, 'sidetreerb/sidetree/operation/operation_type'

      class << self

        def get_instance
          OperationManager.new()
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
        binding.pry
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

      def apply_create_operation

      end

      private

      def initialize()
        @patch_manager = PatchManager.get_instance
      end

      def generate_suffix_data(recover_commitment:, delta_hash:)
        { hoge: "hoge" }
      end

    end
  end
end