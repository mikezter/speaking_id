module SpeakingId
  ASCII_APPROXIMATIONS = {
    196 => [65,  101], # Ä => Ae
    214 => [79,  101], # Ö => Oe
    220 => [85,  101], # Ü => Ue
    223 => [115, 115], # ß => ss
    228 => [97,  101], # ä => ae
    246 => [111, 101], # ö => oe
    252 => [117, 101]  # ü => ue
  }.freeze

  class << self
    def replace_known_special_chars(chars)
      chars = ActiveSupport::Multibyte.proxy_class.new(chars)
      chars = chars.normalize(:kc).unpack('U*')

      chars = chars.inject([]) do |result, char|
        result << approximate_char(char)
      end.flatten.pack('U*')
    end

    def approximate_char(char)
      if ASCII_APPROXIMATIONS.include? char
        return ASCII_APPROXIMATIONS[char]
      end
      char
    end
  end
end

