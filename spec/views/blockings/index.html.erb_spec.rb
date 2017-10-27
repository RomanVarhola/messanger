require 'rails_helper'

RSpec.describe "blockings/index", type: :view do
  before(:each) do
    assign(:blockings, [
      Blocking.create!(),
      Blocking.create!()
    ])
  end

  it "renders a list of blockings" do
    render
  end
end
