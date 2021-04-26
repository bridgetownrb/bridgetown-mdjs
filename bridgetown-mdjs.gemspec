# frozen_string_literal: true

require_relative "lib/bridgetown-mdjs/version"

Gem::Specification.new do |spec|
  spec.name          = "bridgetown-mdjs"
  spec.version       = BridgetownMdjs::VERSION
  spec.author        = "Bridgetown Team"
  spec.email         = "maintainers@bridgetownrb.com"
  spec.summary       = "Kramdown-based support for Markdown JavaScript (mdjs) in Bridgetown"
  spec.homepage      = "https://github.com/bridgetownrb/bridgetown-mdjs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|script|spec|features)/!) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.5.0"

  spec.add_dependency "bridgetown", ">= 0.21.0.beta1", "< 2.0"
  spec.add_dependency "kramdown-parser-gfm-extractions", "~> 1.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rubocop-bridgetown", "~> 0.2"
end
