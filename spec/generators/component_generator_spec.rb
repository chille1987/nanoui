require "spec_helper"
require "fileutils"
require "tmpdir"

# Minimal Rails generator stubs
unless defined?(Rails::Generators::Base)
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
  end
end

require_relative "../../lib/generators/nanoui/component_generator"

RSpec.describe Nanoui::Generators::ComponentGenerator do
  describe "COMPONENT_ORDER" do
    it "lists all 31 components" do
      expect(described_class::COMPONENT_ORDER.size).to eq(31)
    end

    it "includes expected components" do
      %w[button input label card checkbox radio switch select
         badge alert dialog dropdown tooltip toast table tabs accordion progress
         navbar sidebar breadcrumb avatar skeleton
         stat empty timeline checklist copy code upload
         container].each do |name|
        expect(described_class::COMPONENT_ORDER).to include(name)
      end
    end
  end

  describe "STIMULUS_COMPONENTS" do
    it "lists 12 components with Stimulus controllers" do
      expect(described_class::STIMULUS_COMPONENTS.size).to eq(12)
    end

    it "does not include select" do
      expect(described_class::STIMULUS_COMPONENTS).not_to include("select")
    end

    it "matches the keys of CONTROLLER_FILES" do
      expect(described_class::STIMULUS_COMPONENTS).to eq(described_class::CONTROLLER_FILES.keys)
    end
  end

  describe "CONTROLLER_FILES" do
    it "maps each entry to existing controller template files" do
      described_class::CONTROLLER_FILES.each do |component, controllers|
        controllers.each do |controller|
          path = File.join(TEMPLATE_ROOT, "js/controllers/#{controller}_controller.js")
          expect(File.exist?(path)).to be(true),
                                       "Expected controller '#{controller}' for component '#{component}' at #{path}"
        end
      end
    end

    it "maps table to the data_table controller" do
      expect(described_class::CONTROLLER_FILES["table"]).to eq(%w[data_table])
    end
  end

  describe "GROUPS" do
    it "defines all component groups" do
      expect(described_class::GROUPS.keys).to contain_exactly(
        "essentials", "forms", "overlays", "data", "navigation",
        "feedback", "dashboard", "utilities", "layout"
      )
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
      expect(order.last).to eq("container")
    end
  end

  it "does not define update_nanoui_css method" do
    expect(described_class.instance_methods(false)).not_to include(:update_nanoui_css)
  end
end
