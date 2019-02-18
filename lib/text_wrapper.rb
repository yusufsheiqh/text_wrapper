require "text_wrapper/version"

module TextWrapper
  class Error < StandardError; end
  def self.wrap(string, max_len)
    return string if string.length <= max_len

    break_col = string[0...max_len].rindex(' ') || max_len
    string[0...break_col].strip + "\n" + wrap(string[break_col..-1].strip, max_len)
  end
end
