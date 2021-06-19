module Sidetreerb
  module Sidetree
    module Task
      module BatchScheduler
        module_function

        def run(timeout)
          loop do
            Sidetreerb::Sidetree::BatchWrite.write
            sleep timeout
            if stop
              break
            end
          end
        end

      end
    end
  end
end

namespace :sidetreerb do
  namespace :task do
    namespace :batch_scheduer do
      desc 'start batch writer'
      task :start, [] => [:environment] do |_, _|
        Sidetreerb::Task::BatchScheduler.run
      end

      desc 'stop batch writer'
      task :stop, [] => [:environment] do |_, _|
        Sidetreerb::Task::BatchScheduler.run
      end
    end
  end
end