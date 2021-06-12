

module Sidetreerb
  module Sidetree
    autoload :BatchWrite, 'sidetreerb/sidetree/batch_writer'
    autoload :FileManager, 'sidetreerb/sidetree/file_manager'
    autoload :OperationManager, 'sidetreerb/sidetree/operation_manager'
    autoload :PatchManager, 'sidetreerb/sidetree/patch_manager'
    autoload :RequestHandler, 'sidetreerb/sidetree/request_handler'
    autoload :Utils, 'sidetreerb/sidetree/utils'
    autoload :Delta, 'sidetreerb/sidetree/domain/delta'
    autoload :Service, 'sidetreerb/sidetree/domain/service'
  end
end