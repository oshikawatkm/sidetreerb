RSpec.describe 'Sidetreerb::Sidetree::RequestHandler' do
  let(:request_handler) { Sidetreerb::Sidetree::RequestHandler.get_instance }

  describe "" do
    
    context "#handle_request" do
      subject { request_handler.handle_request(create_operation) }

      let(:create_operation) { operation_manager.generate_new_create_operation }
      let(:operation_manager) { Sidetreerb::Sidetree::OperationManager.get_instance }

      it { expect(subject).to be eq 1 }
    end

  end
end