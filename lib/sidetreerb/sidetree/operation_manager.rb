

module Sidetreerb
  module Sidetree
    class OperationManager
      autoload :Delta, 'sidetreerb/sidetreerb/lib/sidetreerb/sidetree/domain/delta'
    
      class << slef

        def get_instance
          OperationManager.new()
        end

      end

      def generate_create_operation
        recover_key_pair = KeyManager.generate_es256_key_pair
        update_key_pair = KeyManager.generate_es256_key_pair

        # generate patch
        patch = PatchManager.generate_replace_patch(update_key_pair)

        delta = Delta.new(update_key_pair.generate_commitment, [patch])
        suffix_data = self.generate_suffix_data(recover_key_pair.generate_commitment, delta.generate_hash)
        CreateOperation.new(suffix_data, delta)
      end

      def generate_update_operation
        UpdateOperation.new()
      end

      def generate_recover_operation
        RecoverOperation.new()
      end

      def generate_deactive_operation
        DeactiveOperation.new()
      end

      private

      def generate_suffix_data
        
      end

    end
  end
end