require_relative "lib/nanoui/version"

Gem::Specification.new do |spec|
  spec.name          = "nanoui"
  spec.version       = Nanoui::VERSION
  spec.authors       = ["Denis Omerovic"]
  spec.email         = ["drupalchille@gmail.com"]
  spec.summary       = "Vanilla CSS + Stimulus component library for Rails"
  spec.description   = "Quality components with semantic HTML, accessibility-first, " \
                        "native CSS nesting, and BEM naming. Zero runtime dependencies."
  spec.homepage      = "https://github.com/chille/nanoui"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.1"
  spec.files         = Dir["lib/**/*", "LICENSE.txt", "README.md", "CHANGELOG.md"]
  spec.require_paths = ["lib"]
  spec.add_dependency "railties", ">= 7.1"
  spec.add_development_dependency "rspec", "~> 3.0"
end
