require 'minitest/autorun'
require 'open3'

class TestExline < Minitest::Test
  def setup
    @test_file = 'test_file.txt'
    File.write(@test_file, <<~EOF)
      line 1
      line 2
      line 3
      line 4
      line 5
      line 6
      line 7
      line 8
      line 9
      line 10
    EOF
  end

  def test_extracts_and_prints_range
    expected_output = "line 3\nline 4\nline 5\n"
    stdout, = Open3.capture2('ruby exline 2..4 test_file.txt')
    assert_equal expected_output, stdout
  end

  def test_extracts_and_prints_separate_lines
    expected_output = "line 3\nline 4\nline 5\n"
    stdout, = Open3.capture2('ruby exline 2,3,4 test_file.txt')
    assert_equal expected_output, stdout
  end

  def test_extracts_and_prints_mixed_ranges_and_separate_lines
    expected_output = "line 2\nline 3\nline 4\nline 6\nline 7\nline 8\nline 9\nline 10\n"
    stdout, = Open3.capture2('ruby exline 1,2,3,5..9 test_file.txt')
    assert_equal expected_output, stdout
  end

  def teardown
    File.delete(@test_file) if File.exist?(@test_file)
  end
end
