require 'json'
require 'erb'

users = JSON.parse(File.read('users.json'))
users_lookup = {}

users.each do |user|
  users_lookup[user['id']] = user['name']
end

def has_channel?(text)
  text != nil && (text.include?('<!channel>') || text.include?('<!everyone'))
end

def get_mentioned(text)
  return "" unless text
  return text.gsub(/<@[\w]+>/).first[2..-2] if text.gsub(/<@[\w]+>/).first
  false
end

result = {}
general = {}

Dir.glob("*/*.json").each do |file|
  next if file.include?('users') || file.include?('channels')

  channel = file.split('/')[0]
  messages = JSON.parse(File.read(file))

  messages.each do |message|
    next unless message['subtype'].nil?

    result[channel] ||= {}
    general[users_lookup[message['user']]] ||= {}

    if get_mentioned(message['text'])
      general[users_lookup[message['user']]][:mentions] ||= 0
      general[users_lookup[message['user']]][:mentions] += 1

      result[channel][users_lookup[get_mentioned(message['text'])]] ||= {}
      result[channel][users_lookup[get_mentioned(message['text'])]][:mentions] ||= 0
      result[channel][users_lookup[get_mentioned(message['text'])]][:mentions] += 1
    end

    if has_channel?(message['text'])
      general[users_lookup[message['user']]][:channels] ||= 0
      general[users_lookup[message['user']]][:channels] += 1

      result[channel][users_lookup[message['user']]] ||= {}
      result[channel][users_lookup[message['user']]][:channels] ||= 0
      result[channel][users_lookup[message['user']]][:channels] += 1
    end

    general[users_lookup[message['user']]][:messages] ||= 0
    general[users_lookup[message['user']]][:messages] += 1

    result[channel][users_lookup[message['user']]] ||= {}
    result[channel][users_lookup[message['user']]][:messages] ||= 0
    result[channel][users_lookup[message['user']]][:messages] += 1
  end
end

template = ERB.new File.new("result.erb").read, nil, "%"
puts template.result(binding)
