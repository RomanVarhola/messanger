require 'rails_helper'

RSpec.describe "blockings/show", type: :view do
  before(:each) do
    @blocking = assign(:blocking, Blocking.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
