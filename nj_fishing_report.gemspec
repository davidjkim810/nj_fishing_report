
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nj_fishing_report/version"

Gem::Specification.new do |spec|
  spec.name          = "nj_fishing_report"
  spec.version       = NjFishingReport::VERSION
  spec.authors       = ["David Kim"]
  spec.email         = ["davidjkim810@gmail.com"]

  spec.summary       = %q{"This gem allows users to view fishing reports in NJ"}
  spec.description   = %q{View the most recent fishing reports in New Jersey. Select a location on the list of popular fishing locations and receive a report.}
  spec.homepage      = "https://github.com/davidjkim810/nj_fishing_report"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", ">= 0"
end
