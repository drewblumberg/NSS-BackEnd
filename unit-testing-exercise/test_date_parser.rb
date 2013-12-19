require_relative 'date_parser'
require 'minitest/autorun'

class TestDateParser < MiniTest::Unit::TestCase
  def test_date_parser_has_a_parse_method
    DateParser.parse("2004/12/24")
  end

  def test_date_parser_US_date
    date = DateParser.parse("12/15/1986")
    assert_equal date, "12/15/1986"
  end

  def test_date_parser_EU_date
    date = DateParser.parse("15/12/1986")
    assert_equal date, "12/15/1986"
  end

  def test_date_parser_no_input
    date = DateParser.parse("")
    assert_equal date, "01/01/1900"
  end

  def test_date_parser_dots_date
    date = DateParser.parse("12.15.1986")
    assert_equal date, "12/15/1986"
  end

  def test_date_parser_dashes_date
    date = DateParser.parse("12-15-1986")
    assert_equal date, "12/15/1986"
  end
end