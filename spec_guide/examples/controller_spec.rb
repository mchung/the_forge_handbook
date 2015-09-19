require "spec_helper"

describe ToolsController do
  describe "#create" do
    context "A glassbreaker with a valid toolbelt" do
      it "adds the tool to the toolbelt" do
        glassbreaker = create(:glassbreaker)
        toolbelt = create(:toolbelt, :glassbreaker_id: glassbreaker.id)

        get :create, glassbreaker_id: glassbreaker.id, tool: "chisel"

        expect(glassbreaker.reload.tools.count).to eq(1)
        expect(response).to redirect_to(toolbelt_path)
      end
    end

    context "A glassbreaker without a toolbelt" do
      it "does not create the tool" do
        glassbreaker = create(:glassbreaker)

        get :create, glassbreaker_id: glassbreaker.id, tool: "chisel"

        expect(glassbreaker.reload.tools.count).to eq(0)
        expect(response).to redirect_to(glassbreaker_path)
      end
    end
  end
end
