require 'test_helper'

class WorkSessionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert WorkSession.new.valid?
  end
end
