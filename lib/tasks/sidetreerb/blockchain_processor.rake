module Sidetreerb
  module Sidetree
    module Task
      module BlockchainProcessor
        module_function

        def run(block_height)
          Sidetreerb::Sidetree::BlockchainProcessor.process_blocks(start_block_height: block_height)
        end

      end
    end
  end
end

namespace :sidetreerb do
  namespace :task do
    namespace :blockchain_processor do
      desc 'start batch writer'
      task :start, [] => [:environment] do |_, args|
        block_height = 100
        Sidetreerb::Task::BlockchainProcessor.run(block_height)
      end

      desc 'stop batch writer'
      task :stop, [] => [:environment] do |_, _|
        Sidetreerb::Task::BatchScheduler.run
      end
    end
  end
end