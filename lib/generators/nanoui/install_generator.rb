module Nanoui
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      APPLICATION_IMPORT = '@import "nanoui/nanoui.css";'.freeze
      LEADING_CSS_HEADER_PATTERN = /\A((?:\s|\/\*.*?\*\/\s*)*(?:@charset\s+[^;]+;\s*)?(?:@import\s+[^;]+;\s*)*)/m.freeze

      desc "Install NanoUI foundation (base styles, fonts)"

      def copy_base
        directory "css/base", "app/assets/stylesheets/nanoui/base"
      end

      def copy_entry_point
        copy_file "css/nanoui.install.css", "app/assets/stylesheets/nanoui/nanoui.css"
      end

      def copy_fonts
        directory "css/fonts", "app/assets/stylesheets/nanoui/fonts"
      end

      def add_import_to_application_css
        application_css = "app/assets/stylesheets/application.css"
        return unless File.exist?(application_css)

        content = File.read(application_css)
        return if content.include?(APPLICATION_IMPORT)

        updated_content = content.sub(LEADING_CSS_HEADER_PATTERN, "\\1#{APPLICATION_IMPORT}\n")
        File.write(application_css, updated_content)
      end

      def print_instructions
        say ""
        say "NanoUI installed!", :green
        say ""
        say "Next steps:"
        say "  1. Run: rails generate nanoui:component --all"
        say "     Or add components individually:"
        say "     rails generate nanoui:component button input card"
        say ""
        say "  2. Customize your theme in:"
        say "     app/assets/stylesheets/nanoui/base/03_colors.css"
        say ""
      end
    end
  end
end
