# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "interior/version"

Gem::Specification.new do |s|
  s.name        = "interior"
  s.version     = Interior::VERSION
  s.authors     = ["Chris Hunt"]
  s.email       = ["chunt@climate.com"]
  s.homepage    = "https://github.com/climate/interior"
  s.summary     = %q{Convert PLSS to latitude and longitude}
  s.description = %q{Find the center latitude/longitude for any grid in the PLSS given township, range, and section.}

  s.rubyforge_project = "interior"

  s.files         = `git ls-files | grep -v maps`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "ruby-debug"

  s.add_runtime_dependency "nokogiri"
end
