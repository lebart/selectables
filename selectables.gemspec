$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "selectables/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "selectables"
  s.version     = Selectables::VERSION
  s.authors     = ["Antoine Bartier"]
  s.email       = ["contact@latoileabordable.com"]
  s.homepage    = "http://latoileabordable.com"
  s.summary = "Rails mountable engine that allows users of an application to easily populate and manage select fields list."
  s.description = "Rails mountable engine that allows users of an application to easily populate and manage select fields list."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.1"

  s.add_development_dependency "sqlite3"
end
