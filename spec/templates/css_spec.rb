require "spec_helper"

RSpec.describe "CSS templates" do
  components = %w[
    accordion alert avatar badge breadcrumb button card checkbox dialog dropdown
    input label navbar progress radio select sidebar skeleton switch table tabs toast tooltip
    stat empty timeline checklist copy code upload
  ]

  components.each do |name|
    it "#{name}.css exists and is non-empty" do
      path = File.join(TEMPLATE_ROOT, "css/components/#{name}.css")
      expect(File.exist?(path)).to be(true), "Missing CSS: #{path}"
      expect(File.size(path)).to be > 0, "Empty CSS: #{path}"
    end
  end

  it "has exactly 30 component CSS files" do
    files = Dir.glob(File.join(TEMPLATE_ROOT, "css/components/*.css"))
    expect(files.size).to eq(30)
  end

  layout_components = %w[container]

  layout_components.each do |name|
    it "#{name}.css exists and is non-empty" do
      path = File.join(TEMPLATE_ROOT, "css/layout/#{name}.css")
      expect(File.exist?(path)).to be(true), "Missing CSS: #{path}"
      expect(File.size(path)).to be > 0, "Empty CSS: #{path}"
    end
  end

  it "has exactly 1 layout CSS file" do
    files = Dir.glob(File.join(TEMPLATE_ROOT, "css/layout/*.css"))
    expect(files.size).to eq(1)
  end
end
