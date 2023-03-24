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

  def test_extracts_and_prints_range_one_based
    expected_output = "line 3\nline 4\nline 5\n"
    stdout, = Open3.capture2('ruby exline 3..5 test_file.txt')
    assert_equal expected_output, stdout
  end

  def test_extracts_and_prints_separate_lines_one_based
    expected_output = "line 3\nline 4\nline 5\n"
    stdout, = Open3.capture2('ruby exline 3,4,5 test_file.txt')
    assert_equal expected_output, stdout
  end

  def test_extracts_and_prints_mixed_ranges_and_separate_lines_one_based
    expected_output = "line 2\nline 3\nline 4\nline 6\nline 7\nline 8\nline 9\nline 10\n"
    stdout, = Open3.capture2('ruby exline 2,3,4,6..10 test_file.txt')
    assert_equal expected_output, stdout
  end

  def test_extracts_and_prints_range_zero_based
    expected_output = "line 2\nline 3\nline 4\n"
    stdout, = Open3.capture2('ruby exline -z 1..3 test_file.txt')
    assert_equal expected_output, stdout
  end

  def test_extracts_and_prints_separate_lines_zero_based
    expected_output = "line 2\nline 3\nline 4\n"
    stdout, = Open3.capture2('ruby exline -z 1,2,3 test_file.txt')
    assert_equal expected_output, stdout
  end

  def test_extracts_and_prints_mixed_ranges_and_separate_lines_zero_based
    expected_output = "line 1\nline 2\nline 3\nline 5\nline 6\nline 7\nline 8\nline 9\n"
    stdout, = Open3.capture2('ruby exline -z 0,1,2,4..8 test_file.txt')
    assert_equal(expected_output, stdout)
  end

  def teardown
    File.delete(@test_file) if File.exist?(@test_file)
  end
end