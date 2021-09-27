
module SIGHASH_TYPE
  module Config
    
    def configure

    end

    def blockchain_config(blockchain)
      case blockchain
      when 'bitcoin'
        Sidetree::Blockchain.condigure(config)
        Sidetree::Blockchain.blockchain_adapter = Sidetree::Blockchain::Bitcoin.new
      when 'litecoin'
      
      when 'ethereum'
  
      else
        raise 'Not implemented'
      end
    end

  end
end