require "spec_helper"

RSpec.describe "View templates" do
  partials = %w[
    accordion alert badge button card checkbox dialog dropdown
    input label progress radio_group select switch
    table tabs toast toast_container tooltip
  ]

  partials.each do |name|
    it "_#{name}.html.erb exists" do
      path = File.join(TEMPLATE_ROOT, "views/components/_#{name}.html.erb")
      expect(File.exist?(path)).to be(true), "Missing partial: #{path}"
    end
  end

  it "has exactly 19 ERB partials" do
    files = Dir.glob(File.join(TEMPLATE_ROOT, "views/components/_*.html.erb"))
    expect(files.size).to eq(19)
  end

  it "does not use content_for-based slots in component partials" do
    %w[alert card dialog dropdown].each do |name|
      path = File.join(TEMPLATE_ROOT, "views/components/_#{name}.html.erb")
      expect(File.read(path)).not_to include("content_for?")
    end
  end

  it "does not mark tab content as html_safe" do
    path = File.join(TEMPLATE_ROOT, "views/components/_tabs.html.erb")
    expect(File.read(path)).not_to include("tab[:content].html_safe")
  end

  it "uses tag builders instead of manual html attribute serialization" do
    %w[badge input switch].each do |name|
      path = File.join(TEMPLATE_ROOT, "views/components/_#{name}.html.erb")
      content = File.read(path)

      expect(content).not_to include("html.map")
    end
  end
end
