RSpec.describe 'Sidetreerb::Sidetree::OperationManager' do
  let(:operation_manager) { Sidetreerb::Sidetree::OperationManager.get_instance }

  describe "" do
    
    context "#generate_new_create_operation" do
      subject { operation_manager.generate_new_create_operation }

      it { expect(subject).to be eq 1 }
    end

    context "#generate_new_create_operation" do
    subject { create_operation.export_json }
    let(:create_operation) { operation_manager.generate_new_create_operation }

    it { expect(subject).to be eq 1 }
    end

  end
end