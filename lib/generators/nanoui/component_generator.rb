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
      ].freeze

      argument :components, type: :array, default: [], banner: "component [component] ..."

      class_option :group, type: :string, desc: "Install a component group"
      class_option :all, type: :boolean, default: false, desc: "Install all components"

      GROUPS = {
        "essentials" => %w[button input label card badge alert],
        "forms"      => %w[button input label checkbox radio switch select badge alert],
        "overlays"   => %w[dialog dropdown tooltip toast],
        "data"       => %w[table tabs accordion progress],
      }.freeze

      STIMULUS_COMPONENTS = %w[dialog dropdown tooltip toast tabs accordion switch].freeze
      PARTIAL_TEMPLATES = COMPONENT_ORDER.each_with_object({}) do |name, partials|
        partials[name] = [name]
      end.merge(
        "radio" => %w[radio_group],
        "toast" => %w[toast toast_container]
      ).freeze

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
          copy_file "css/components/#{name}.css",
                    "app/assets/stylesheets/nanoui/components/#{name}.css"
        end
      end

      def copy_stimulus_controllers
        @resolved.each do |name|
          next unless STIMULUS_COMPONENTS.include?(name)
          copy_file "js/controllers/#{name}_controller.js",
                    "app/javascript/controllers/nanoui_#{name}_controller.js"
        end
      end

      def copy_partials
        @resolved.each do |name|
          PARTIAL_TEMPLATES.fetch(name, [name]).each do |partial_name|
            source = "views/components/_#{partial_name}.html.erb"
            next unless File.exist?(File.join(self.class.source_root, source))

            copy_file source, "app/views/components/_#{partial_name}.html.erb"
          end
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
