require 'spec_helper'

describe "expressions/edit.html.haml" do
  before(:each) do
    @expression = assign(:expression, stub_model(Expression,
                                                 :name => "MyText",
                                                 :definition => "MyText",
                                                 :notes => "MyText"
    ))
    # mock up an authentication in the underlying warden library
    @request.env['warden'] = mock(Warden, :authenticate? => false)
  end

  it "renders the edit expression form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => expressions_path(@expression), :method => "post" do
      assert_select "input#expression_name", :name => "expression[name]"
      assert_select "textarea#expression_definition", :name => "expression[definition]"
      assert_select "input#expression_notes", :name => "expression[notes]"
    end
  end
end
