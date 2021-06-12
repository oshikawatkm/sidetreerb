
RSpec.describe "Sidetreerb::Sidetree::OperationManager" do
  let!(:operation_manager) { Sidetreerb::Sidetree::OperationManager.get_instance }

  describe "" do
    
    context "#generate_create_operation" do
      subject { operation_manager.generate_create_operation }

      it { expect(subject).to eq 1 }
    end

  end

end