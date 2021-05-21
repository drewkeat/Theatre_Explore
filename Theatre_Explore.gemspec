# frozen_string_literal: true
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "lib/Theatre_Explore/version"

Gem::Specification.new do |spec|
  spec.name          = "Theatre_Explore"
  spec.version       = Theatre_Explore::VERSION
  spec.authors       = ["Drew Keat"]
  spec.email         = ["drewjkeat@gmail.com"]

  spec.summary       = "Theatre_Explore uses a command line interface to reference information from the website broadwayworld.com."
  spec.description   = "Theatre Explore provides a CLI for users to interact with production information from the website www.broadwayworld.com.  The user experience begins with selecting whether to search for productions by name or by year.  After that selection, specific aspects of a chosen production can be viewed in greater detail."
  spec.homepage      = "https://github.com/drewkeat/Theatre_Explore"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/drewkeat/Theatre_Explore"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["Theatre_Explore"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rake", "~> 13.0"
  spec.add_dependency "mechanize", "~> 2.8.0"
  spec.add_development_dependency "pry", "~> 0.14.0"
  

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
