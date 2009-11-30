require 'test_helper'

class SecteurTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Secteur.new.valid?
  end
end
