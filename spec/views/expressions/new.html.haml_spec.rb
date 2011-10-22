require 'spec_helper'

describe "expressions/new.html.haml" do
  before(:each) do
    assign(:expression, stub_model(Expression,
                                   :name => "MyText",
                                   :definition => "MyText",
                                   :notes => "MyText"
    ).as_new_record)
    # mock up an authentication in the underlying warden library
    @request.env['warden'] = mock(Warden, :authenticate? => false)
  end

  it "renders new expression form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => expressions_path, :method => "post" do
      assert_select "input#expression_name", :name => "expression[name]"
      assert_select "textarea#expression_definition", :name => "expression[definition]"
      assert_select "input#expression_notes", :name => "expression[notes]"
    end
  end
end
