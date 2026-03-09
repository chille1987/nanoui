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

  it "uses the toggled details element directly for accordion single mode" do
    path = File.join(TEMPLATE_ROOT, "js/controllers/accordion_controller.js")
    content = File.read(path)

    expect(content).to include("const current = event.currentTarget")
    expect(content).not_to include("data-accordion-target")
  end

  it "syncs dropdown state with an interactive trigger element" do
    path = File.join(TEMPLATE_ROOT, "js/controllers/dropdown_controller.js")
    content = File.read(path)

    expect(content).to include("get triggerElement()")
    expect(content).to include("syncTriggerState")
  end

  it "clears any pending tooltip timer before scheduling a new one" do
    path = File.join(TEMPLATE_ROOT, "js/controllers/tooltip_controller.js")
    content = File.read(path)

    expect(content).to include("clearTimeout(this.timeout)")
  end
end
