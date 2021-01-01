require 'yaml'

def load_library(path)
  emoticons = YAML.load_file(path)
  new_hash = {}
  emoticons.each do |key, value|
    new_hash[key] = {:english => value[0], :japanese => value[1]}
  end
  new_hash
end

def get_japanese_emoticon(path, emoticon_eng)
  japanese_hash = load_library(path)
  japanese_hash.each do |key, value|
    if value[:english] == emoticon_eng
      return value[:japanese]
    end
  end
  return  "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon_jpn)
  english_hash = load_library(path)
  english_hash.each do |key, value|
    if value[:japanese] == emoticon_jpn
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end