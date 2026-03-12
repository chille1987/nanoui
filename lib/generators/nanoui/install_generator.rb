module Nanoui
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      desc "Install NanoUI foundation (base styles, fonts)"

      def copy_base
        directory "css/base", "app/assets/stylesheets/nanoui/base"
      end

      def copy_fonts
        directory "css/fonts", "app/assets/stylesheets/nanoui/fonts"
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
