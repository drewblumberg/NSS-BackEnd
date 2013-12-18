require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_a_name_with_no_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("brt")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... B
Give me an... R
Give me a... T
You're the best, Brt!
EOS
    assert_equal shell_output, expected_output
  end

  def test_a_name_with_no_vowels_a_different_way
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("brt")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes_in_order shell_output, "Give me a... B", "Give me an... R", "Give me a... T"
  end

  # But what about names with vowels?!!
  def test_a_name_with_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("Drew")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... D
Give me an... R
Give me an... E
Give me a... W
You're the best, Drew!
EOS
    assert_equal shell_output, expected_output
  end
end