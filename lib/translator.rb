require "yaml"
# require 'pry'

def load_library(file_name)
  file_to_map = YAML.load_file(file_name)
  file_to_map.map do |emoticon_name_key, value|
    file_to_map[emoticon_name_key] = {:english => value[0], :japanese => value[1]}
    # binding.pry
  end
  file_to_map
end

load_library('lib/emoticons.yml')

def get_english_meaning(file_name, japanese_emoticon)
  emoticon_library = load_library(file_name)
  emoticon_library.map do |key, value|
    if value[:japanese] == japanese_emoticon
        return key
    end
  end
  return "Sorry, that emoticon was not found"
end

get_english_meaning('lib/emoticons.yml', "(＾ｖ＾)")


def get_japanese_emoticon(file_name, western_emoticon)
  emoticon_library = load_library(file_name)
  emoticon_library.map do |key, value|
    if value[:english] == western_emoticon
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

get_japanese_emoticon('lib/emoticons.yml', ":)")
