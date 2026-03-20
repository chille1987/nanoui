module Nanoui
  module Generators
    class ComponentGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      COMPONENT_ORDER = %w[
        button
        input
        label
        card
        checkbox
        radio
        switch
        select
        badge
        alert
        dialog
        dropdown
        tooltip
        toast
        table
        tabs
        accordion
        progress
        container
      ].freeze

      LAYOUT_COMPONENTS = %w[container].freeze

      argument :components, type: :array, default: [], banner: "component [component] ..."

      class_option :group, type: :string, desc: "Install a component group"
      class_option :all, type: :boolean, default: false, desc: "Install all components"

      GROUPS = {
        "essentials" => %w[button input label card badge alert],
        "forms"      => %w[button input label checkbox radio switch select badge alert],
        "overlays"   => %w[dialog dropdown tooltip toast],
        "data"       => %w[table tabs accordion progress],
        "layout"     => %w[container],
      }.freeze

      STIMULUS_COMPONENTS = %w[dialog dropdown tooltip toast tabs accordion switch].freeze

      def resolve_components
        @resolved = if options[:all]
          GROUPS.values.flatten.uniq
        elsif options[:group]
          GROUPS.fetch(options[:group]) { abort "Unknown group: #{options[:group]}" }
        else
          components
        end

        abort "Specify components, --group, or --all" if @resolved.empty?
      end

      def copy_component_css
        @resolved.each do |name|
          subfolder = LAYOUT_COMPONENTS.include?(name) ? "layout" : "components"
          copy_file "css/#{subfolder}/#{name}.css",
                    "app/assets/stylesheets/nanoui/#{subfolder}/#{name}.css"
        end
      end

      def copy_stimulus_controllers
        @resolved.each do |name|
          next unless STIMULUS_COMPONENTS.include?(name)
          copy_file "js/controllers/#{name}_controller.js",
                    "app/javascript/controllers/nanoui_#{name}_controller.js"
        end
      end

      def print_summary
        say ""
        say "NanoUI components installed:", :green
        @resolved.each do |name|
          parts = ["CSS"]
          parts << "Stimulus" if STIMULUS_COMPONENTS.include?(name)
          say "  ✓ #{name} (#{parts.join(", ")})"
        end
        say ""
      end
    end
  end
end
