module Sidetreerb
  module Sidetree
    module Task
      module BatchScheduler
        module_function

        def run
          Sidetreerb::Sidetree::BatchWrite.write
        end

      end
    end
  end
end

namespace :sidetreerb do
  namespace :task do
    namespace :batch_scheduer do
      desc 'start batch writer'
      task :start, [] => [:environment] do |_, args|
        minutes = args[:minutes] ||= 5 
        timeout = minutes * 60
        Sidetreerb::Task::BatchScheduler.run(timeout)
      end

      desc 'stop batch writer'
      task :stop, [] => [:environment] do |_, _|
        Sidetreerb::Task::BatchScheduler.run
      end
    end
  end
end