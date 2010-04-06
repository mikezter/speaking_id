String.class_eval do
  # Replaces known special characters and removes unknown characters in a string
  # so that it may be used as part of a 'pretty' URL.
  def normalize(sep = '-')
    return if self.blank?

    s = SpeakingId::replace_known_special_chars(self)

    # Remove anything non-ASCII entirely.
    s = s.gsub(/[^\x00-\x7F]+/, '')

    # Remove non-word characters.
    s = s.gsub(/[^\w_ \-]+/i, '')

    # Convert whitespaces to separator.
    s = s.gsub(/[ \-]+/i, sep)

    # Remove leading/trailing separators.
    s = s.gsub(/^(\_|\-)|(\_|\-)$/i, '')

    s.downcase
  end
end

