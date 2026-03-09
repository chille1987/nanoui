require "spec_helper"

RSpec.describe "CSS templates" do
  components = %w[
    accordion alert badge button card checkbox dialog dropdown
    input label progress radio select switch table tabs toast tooltip
  ]

  components.each do |name|
    it "#{name}.css exists and is non-empty" do
      path = File.join(TEMPLATE_ROOT, "css/components/_#{name}.css")
      expect(File.exist?(path)).to be(true), "Missing CSS: #{path}"
      expect(File.size(path)).to be > 0, "Empty CSS: #{path}"
    end
  end

  it "has exactly 18 component CSS files" do
    files = Dir.glob(File.join(TEMPLATE_ROOT, "css/components/_*.css"))
    expect(files.size).to eq(18)
  end
end
