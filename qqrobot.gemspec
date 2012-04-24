# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "qqrobot/version"

Gem::Specification.new do |s|
  s.name        = "qqrobot"
  s.version     = Qqrobot::VERSION
  s.authors     = ["simsicon"]
  s.email       = ["simsicon@gmail.com"]
  s.homepage    = ""
  s.summary     = "qq robot"
  s.description = "yes, it's a qq robot, so what?"

  s.rubyforge_project = "qqrobot"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
