require "minitest/autorun"
require "minitest/reporters"
require "fileutils"

require "bridgetown"
require "bridgetown-mdjs"

Minitest::Reporters.use! [
  Minitest::Reporters::DefaultReporter.new(
    color: true
  ),
]

class TestMdjs < Minitest::Test
  def setup
    Dir.chdir(__dir__ + "/fixture")
    FileUtils.remove_dir "output", true
    @site = Bridgetown::Site.new(Bridgetown.configuration(quiet: true))
  end

  def test_correct_output
    indexhtml = process_and_read_index_file
    assert_includes indexhtml, "Welcome to Bridgetown"
    refute_includes indexhtml, "kramdown-extraction"
    assert_includes indexhtml, "<script type=\"module\">\nalert(\"howdy!\")\n</script>\n\n    </main>"
  end

  def test_including_extraction_tags
    @site.config.kramdown.include_extraction_tags = true
    indexhtml = process_and_read_index_file
    assert_includes indexhtml, "kramdown-extraction"
  end

  private

  def process_and_read_index_file
    @site.process 
    File.read(__dir__ + "/fixture/output/index.html")
  end
end

