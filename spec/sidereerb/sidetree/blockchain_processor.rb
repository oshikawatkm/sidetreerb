RSpec.describe 'Sidetreerb::Sidetree::BlockchainProcessor' do
  let(:blockchain_processor) { Sidetreerb::Sidetree::BlockchainProcessor.get_instance }

  describe "" do

    context '' do
      subject { blockchain_processor.process_block }
      
      it { expect(subject).to be eq 1 }
    end
  end

end