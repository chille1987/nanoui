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
      COMPONENT_IMPORT_PATTERN = /^\s*@import "components\/_([^\"]+)\.css";\s*\n?/

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
          copy_file "css/components/_#{name}.css",
                    "app/assets/stylesheets/nanoui/components/_#{name}.css"
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
          source = "views/components/_#{name}.html.erb"
          next unless File.exist?(File.join(self.class.source_root, source))
          copy_file source, "app/views/components/_#{name}.html.erb"
        end
      end

      def update_nanoui_css
        nanoui_css = "app/assets/stylesheets/nanoui/nanoui.css"
        return unless File.exist?(nanoui_css)

        content = File.read(nanoui_css)
        content_without_component_imports = content.gsub(COMPONENT_IMPORT_PATTERN, "")
        component_section = ["/* Components */", component_imports].reject(&:empty?).join("\n")

        updated_content = if content_without_component_imports.include?("/* Components */")
          content_without_component_imports.sub("/* Components */", component_section)
        else
          "#{content_without_component_imports.rstrip}\n\n#{component_section}\n"
        end

        File.write(nanoui_css, updated_content)
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

      private

      def component_imports
        installed_components.map { |name| "@import \"components/_#{name}.css\";" }.join("\n")
      end

      def installed_components
        component_dir = "app/assets/stylesheets/nanoui/components"
        names = Dir.glob(File.join(component_dir, "_*.css")).map do |path|
          File.basename(path, ".css").delete_prefix("_")
        end

        names.uniq.sort_by do |name|
          [COMPONENT_ORDER.index(name) || COMPONENT_ORDER.length, name]
        end
      end
    end
  end
end
