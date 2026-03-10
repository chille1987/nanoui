require "spec_helper"
require "fileutils"
require "tmpdir"

# Minimal Rails generator stubs
module Rails
  module Generators
    class Base
      def self.source_root(path = nil)
        @source_root = path if path
        @source_root
      end

      def self.argument(*args); end
      def self.class_option(*args); end
      def self.desc(text = nil); end
    end
  end
end unless defined?(Rails::Generators::Base)

require_relative "../../lib/generators/nanoui/component_generator"

RSpec.describe Nanoui::Generators::ComponentGenerator do
  describe "COMPONENT_ORDER" do
    it "lists all 18 components" do
      expect(described_class::COMPONENT_ORDER.size).to eq(18)
    end

    it "includes expected components" do
      %w[button input label card checkbox radio switch select
         badge alert dialog dropdown tooltip toast table tabs accordion progress].each do |name|
        expect(described_class::COMPONENT_ORDER).to include(name)
      end
    end
  end

  describe "STIMULUS_COMPONENTS" do
    it "lists 7 components with Stimulus controllers" do
      expect(described_class::STIMULUS_COMPONENTS.size).to eq(7)
    end

    it "does not include select" do
      expect(described_class::STIMULUS_COMPONENTS).not_to include("select")
    end

    it "only lists components that have controller files" do
      described_class::STIMULUS_COMPONENTS.each do |name|
        controller_path = File.join(TEMPLATE_ROOT, "js/controllers/#{name}_controller.js")
        expect(File.exist?(controller_path)).to be(true),
          "Expected controller file for '#{name}' at #{controller_path}"
      end
    end
  end

  describe "GROUPS" do
    it "defines essentials, forms, overlays, and data groups" do
      expect(described_class::GROUPS.keys).to contain_exactly("essentials", "forms", "overlays", "data")
    end

    it "only references valid components" do
      all_components = described_class::COMPONENT_ORDER
      described_class::GROUPS.each do |group, components|
        components.each do |name|
          expect(all_components).to include(name),
            "Group '#{group}' references unknown component '#{name}'"
        end
      end
    end
  end

  describe "PARTIAL_TEMPLATES" do
    it "maps radio to the radio_group partial" do
      expect(described_class::PARTIAL_TEMPLATES.fetch("radio")).to eq(%w[radio_group])
    end

    it "installs the toast container alongside the toast partial" do
      expect(described_class::PARTIAL_TEMPLATES.fetch("toast")).to eq(%w[toast toast_container])
    end
  end

  describe "CSS import ordering" do
    it "COMPONENT_ORDER matches the canonical import order" do
      order = described_class::COMPONENT_ORDER
      expect(order.first).to eq("button")
      expect(order.last).to eq("progress")
    end
  end

  describe "legacy component CSS compatibility" do
    around do |example|
      Dir.mktmpdir do |dir|
        Dir.chdir(dir) { example.run }
      end
    end

    it "normalizes legacy underscored filenames when listing installed components" do
      component_dir = "app/assets/stylesheets/nanoui/components"
      FileUtils.mkdir_p(component_dir)
      File.write(File.join(component_dir, "_button.css"), "/* legacy */")
      File.write(File.join(component_dir, "input.css"), "/* current */")

      generator = described_class.allocate

      expect(generator.send(:installed_components)).to eq(%w[button input])
    end

    it "rewrites legacy imports to a single canonical component import" do
      component_dir = "app/assets/stylesheets/nanoui/components"
      FileUtils.mkdir_p(component_dir)
      File.write(File.join(component_dir, "_button.css"), "/* legacy */")
      File.write(File.join(component_dir, "button.css"), "/* current */")

      nanoui_css = "app/assets/stylesheets/nanoui/nanoui.css"
      FileUtils.mkdir_p(File.dirname(nanoui_css))
      File.write(nanoui_css, <<~CSS)
        /* NanoUI */

        /* Components */
        @import "components/_button.css";
        @import "components/button.css";
      CSS

      described_class.allocate.update_nanoui_css
      content = File.read(nanoui_css)

      expect(content.scan('@import "components/button.css";').size).to eq(1)
      expect(content).not_to include('@import "components/_button.css";')
    end
  end
end
