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
end
