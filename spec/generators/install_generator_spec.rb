require "spec_helper"
require "fileutils"
require "tmpdir"

# Minimal Rails generator stubs so we can load the generator without full Rails
module Rails
  module Generators
    class Base
      def self.source_root(path = nil)
        @source_root = path if path
        @source_root
      end

      def self.argument(*args); end
      def self.class_option(*args); end

      def self.desc(text = nil)
        @desc = text if text
        @desc
      end
    end
  end
end

require_relative "../../lib/generators/nanoui/install_generator"

RSpec.describe Nanoui::Generators::InstallGenerator do
  it "defines source_root pointing to templates directory" do
    root = described_class.source_root
    expect(root).to end_with("lib/generators/nanoui/templates")
    expect(Dir.exist?(root)).to be true
  end

  it "does not define copy_tokens method" do
    expect(described_class.instance_methods(false)).not_to include(:copy_tokens)
  end

  it "has copy_base method" do
    expect(described_class.instance_methods(false)).to include(:copy_base)
  end

  it "has copy_fonts method" do
    expect(described_class.instance_methods(false)).to include(:copy_fonts)
  end

  it "does not define copy_entry_point method" do
    expect(described_class.instance_methods(false)).not_to include(:copy_entry_point)
  end

  it "does not define add_import_to_application_css method" do
    expect(described_class.instance_methods(false)).not_to include(:add_import_to_application_css)
  end
end
