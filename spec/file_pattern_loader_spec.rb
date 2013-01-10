require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe UserAgentParser::FilePatternLoader do
  def described_class
    UserAgentParser::FilePatternLoader
  end

  describe "#initialize" do
    it "sets path" do
      path = 'some/path/for/regexes.yaml'
      loader = described_class.new(path)
      loader.path.must_equal path
    end
  end

  describe "#patterns" do
    it "returns hash of patterns" do
      loader = described_class.new(UserAgentParser::DefaultPatternPath)
      expected = %w[
        device_parsers
        os_parsers
        user_agent_parsers
      ]
      loader.patterns.keys.sort.must_equal expected
    end
  end
end