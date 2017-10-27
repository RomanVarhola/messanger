require 'rails_helper'

RSpec.describe "blockings/new", type: :view do
  before(:each) do
    assign(:blocking, Blocking.new())
  end

  it "renders new blocking form" do
    render

    assert_select "form[action=?][method=?]", blockings_path, "post" do
    end
  end
end
