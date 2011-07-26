# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "firelinks/version"

Gem::Specification.new do |s|
  s.name        = "firelinks"
  s.version     = Firelinks::VERSION
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.8.6'

  s.authors     = ["Daniel Choi"]
  s.email       = ["dhchoi@gmail.com"]
  s.homepage    = "http://danielchoi.com/software/firelinks.html"
  s.summary     = %q{Mirror Firefox in elinks}
  s.description = %q{Mirror Firefox in elinks}

  s.rubyforge_project = "firelinks"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

end

