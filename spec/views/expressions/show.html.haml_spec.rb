require 'spec_helper'

describe "expressions/show.html.haml" do
  before(:each) do
    @expression = assign(:expression, stub_model(Expression,
      :name => "MyText",
      :definition => "MyText",
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
