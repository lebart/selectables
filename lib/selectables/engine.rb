module Selectables
  class Engine < ::Rails::Engine
    isolate_namespace Selectables
     initializer "Selectables precompile hook" do |app|
       app.config.assets.precompile += ['selectables/selectables.*']
    end
  end
end
