require "bundler/setup"
require "sidetreerb"
require 'rake'

RSpec.configure do |config|
  config.disable_monkey_patching!
  
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:suite) do
    config = { 
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
    Sidetreerb::Blockchain.configure(config)
  end

end
