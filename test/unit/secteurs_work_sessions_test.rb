require 'test_helper'

class SecteursWorkSessionsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SecteursWorkSessions.new.valid?
  end
end
