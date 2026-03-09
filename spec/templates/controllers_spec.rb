require "spec_helper"

RSpec.describe "Stimulus controller templates" do
  controllers = %w[accordion dialog dropdown switch tabs toast tooltip]

  controllers.each do |name|
    describe "#{name}_controller.js" do
      let(:path) { File.join(TEMPLATE_ROOT, "js/controllers/#{name}_controller.js") }
      let(:content) { File.read(path) }

      it "exists" do
        expect(File.exist?(path)).to be(true), "Missing controller: #{path}"
      end

      it "exports a default class" do
        expect(content).to match(/export default class/)
      end

      it "imports from @hotwired/stimulus" do
        expect(content).to include('from "@hotwired/stimulus"')
      end
    end
  end

  it "has exactly 7 controller files" do
    files = Dir.glob(File.join(TEMPLATE_ROOT, "js/controllers/*_controller.js"))
    expect(files.size).to eq(7)
  end
end
