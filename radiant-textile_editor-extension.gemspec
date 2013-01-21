# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-textile_editor-extension"

Gem::Specification.new do |s|
  s.name        = "radiant-textile_editor-extension"
  s.version     = RadiantTextileEditorExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = RadiantTextileEditorExtension::AUTHORS
  s.email       = RadiantTextileEditorExtension::EMAIL
  s.homepage    = RadiantTextileEditorExtension::URL
  s.summary     = RadiantTextileEditorExtension::SUMMARY
  s.description = RadiantTextileEditorExtension::DESCRIPTION
  
  ignores = if File.exist?(".gitignore")
    File.read(".gitignore").split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir["**/*"] - ignores
  s.test_files    = Dir["test/**/*","spec/**/*","features/**/*"] - ignores
  s.require_paths = ["lib"]

  # s.add_dependency "some_gem", "~> 1.0.0"

  s.post_install_message = %{
  Add this to your radiant project with:
    config.gem "radiant-textile_editor-extension", :version => "~> #{RadiantTextileEditorExtension::VERSION}"
  }
end