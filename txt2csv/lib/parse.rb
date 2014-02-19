class Parse
  def self.parse_names(prefixes, suffixes, name_string)
    parsed_name = { pre: '', first: '', middle: '', last: '', suffix: '' }

    word = name_string.split
    parsed_name[:suffix] = word.pop if suffixes.include? word.last
    parsed_name[:last] = word.last
    parsed_name[:pre] = word.shift if prefixes.include? word.first
    parsed_name[:first] = word.shift if word.count > 1
    parsed_name[:middle] = word.first if word.count > 1

    parsed_name.values
  end

  def self.parse_phone(phone_string)
    parsed_phone = { country: '', area: '', body: '', tail: '', ext: '' }

    phone_string.gsub!('-', ' ')
    phone_string.gsub!('(', ' ')
    phone_string.gsub!(')', ' ')
    phone_string.gsub!('.', ' ')

    part = phone_string.split

    parsed_phone[:ext] = part.pop if part.index { | a | a.match /x/ }

    parsed_phone[:ext].gsub!('x', '')

    parsed_phone[:tail] = part.pop

    parsed_phone[:body] = part.pop

    part.last ? (parsed_phone[:area] = part.pop) : ''

    part.last ? (parsed_phone[:country] = part.pop) : ''

    parsed_phone.values
  end

  def self.parse_twitter(twitter_string)
    twitter_string.gsub!('@', '')
    handle = twitter_string.split
    parsed_twitter = { twitter: '' }
    parsed_twitter[:twitter] = handle.pop
    parsed_twitter.values
  end

  def self.parse_email(email_string)
    [email_string =~ /^\S+\@\S+\.(...|..)/ ? email_string : 'Not Found']
  end
end
