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
        navbar
        sidebar
        breadcrumb
        avatar
        skeleton
        stat
        empty
        timeline
        checklist
        copy
        code
        upload
        container
      ].freeze

      LAYOUT_COMPONENTS = %w[container].freeze

      argument :components, type: :array, default: [], banner: "component [component] ..."

      class_option :group, type: :string, desc: "Install a component group"
      class_option :all, type: :boolean, default: false, desc: "Install all components"

      GROUPS = {
        "essentials" => %w[button input label card badge alert],
        "forms" => %w[button input label checkbox radio switch select badge alert upload],
        "overlays" => %w[dialog dropdown tooltip toast],
        "data" => %w[table tabs accordion progress],
        "navigation" => %w[navbar sidebar breadcrumb],
        "feedback" => %w[avatar skeleton],
        "dashboard" => %w[stat empty timeline checklist],
        "utilities" => %w[copy code],
        "layout" => %w[container],
      }.freeze

      # Maps a component name to the Stimulus controller files it installs.
      # Most components ship with a same-named controller, but `table` ships
      # with the richer `data_table` controller for sort + pagination behavior.
      CONTROLLER_FILES = {
        "dialog" => %w[dialog],
        "dropdown" => %w[dropdown],
        "tooltip" => %w[tooltip],
        "toast" => %w[toast],
        "tabs" => %w[tabs],
        "accordion" => %w[accordion],
        "switch" => %w[switch],
        "navbar" => %w[navbar],
        "sidebar" => %w[sidebar],
        "copy" => %w[copy],
        "upload" => %w[upload],
        "table" => %w[data_table],
      }.freeze

      STIMULUS_COMPONENTS = CONTROLLER_FILES.keys.freeze

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
          CONTROLLER_FILES.fetch(name, []).each do |controller|
            copy_file "js/controllers/#{controller}_controller.js",
                      "app/javascript/controllers/nanoui_#{controller}_controller.js"
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
