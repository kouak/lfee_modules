require 'test_helper'

class RolesUsersTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert RolesUsers.new.valid?
  end
end
