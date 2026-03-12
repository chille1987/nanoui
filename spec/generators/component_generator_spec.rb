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

  it "does not define copy_partials method" do
    expect(described_class.instance_methods(false)).not_to include(:copy_partials)
  end

  describe "COMPONENT_ORDER ordering" do
    it "COMPONENT_ORDER matches the canonical order" do
      order = described_class::COMPONENT_ORDER
      expect(order.first).to eq("button")
      expect(order.last).to eq("progress")
    end
  end

  it "does not define update_nanoui_css method" do
    expect(described_class.instance_methods(false)).not_to include(:update_nanoui_css)
  end
end
