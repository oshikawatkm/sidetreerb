RSpec.describe 'Sidetreerb::Blockchain' do
  let(:blockchain) { Sidetreerb::Blockchain.configure(config) }

  describe "bitcoin" do
    let(:config) { 
      { 
        blockchain: { 
          type: 'bitcoin',
          schema: 'http', 
          host: '0.0.0.0', 
          port: 18443, 
          user: 'rpcuser', 
          password: 'rpcpassword',
          walelt_name: 'wallet1'
        } 
      } 
    }

    context "#get_new_address" do
      subject { blockchain.get_new_address }
      it { expect(subject).to be eq 1 }
    end

    context "#get_blockcount" do
      subject { blockchain.get_blockcount }
      it { expect(subject).to be eq 1 }
    end

    context "#" do
      subject { blockchain.list_wallet }
      it { expect(subject).to be eq 1 }
    end

    context "#list_unspent" do
      subject { blockchain.list_unspent }
      it { expect(subject).to be eq 1 }
    end
    
    
  end
end