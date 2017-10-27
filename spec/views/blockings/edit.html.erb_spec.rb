require 'rails_helper'

RSpec.describe "blockings/edit", type: :view do
  before(:each) do
    @blocking = assign(:blocking, Blocking.create!())
  end

  it "renders the edit blocking form" do
    render

    assert_select "form[action=?][method=?]", blocking_path(@blocking), "post" do
    end
  end
end
