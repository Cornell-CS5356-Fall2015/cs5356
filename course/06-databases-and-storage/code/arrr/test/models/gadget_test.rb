require 'test_helper'

class GadgetTest < ActiveSupport::TestCase
  test "can be associated with a widget" do
    widget = Fabricate(:widget)
    gadget = Fabricate(:gadget, widget: widget)

    assert_equal Gadget.find(gadget.id).widget, widget
  end
end
