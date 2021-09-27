RSpec.describe 'Sidetreerb::Sidetree::FileManager' do
  let(:file_manager) { Sidetreerb::Sidetree::FileManager.get_instance }
  let(:operation_manager) { Sidetreerb::Sidetree::OperationManager.get_instance }

  describe "" do
    
    context "#generate_core_index_file" do
      subject do
        file_manager.generate_core_index_file(
            core_proof_file_index: core_proof_file_index,
            provisional_index_file_uri: 
            provisional_index_file_uri,
            writer_lock_id: writer_lock_id,
            create_operations: [create_operation]
          ) 
      end

      let(:core_proof_file_index) { "test" }
      let(:provisional_index_file_uri) { "test" }
      let(:writer_lock_id) { "test" }
      let(:create_operation) { operation_manager.generate_new_create_operation }

      # it { expect(subject).to be eq 1 }
      it { expect(subject.export_json).to be eq 1 }
    end

  end
end