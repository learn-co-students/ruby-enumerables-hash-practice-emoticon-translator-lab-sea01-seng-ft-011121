# require modules here
require 'pry'
require 'yaml'


#I think this one can be made much more efficiently, but it passes. 

def load_library(file)
emotes = YAML.load_file(file).each_with_object({}) do |(keys, values), new_obj|
   values.each_with_object({}) do |emote, inner_obj|
    if !inner_obj[values]
      inner_obj = {:english => values[0], :japanese => values[1]}
      end
    if !new_obj[keys]
      new_obj[keys] = inner_obj
      end
        end
end
end

#help from carlos
def get_japanese_emoticon(path, emoticon)
  load_library(path).each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end



def get_english_meaning(file, emote)
load_library(file).each do |key, value| 
   if value[:japanese] == emote
    return key
end
end
return "Sorry, that emoticon was not found"
end








# Help from Carlos:
# require 'yaml'
# require 'pry'
# def load_library(path)
#   final_hash = {}
#   YAML.load_file(path).each do |key, value|
#     final_hash[key] = {}
#     final_hash[key][:english] = value[0]
#     final_hash[key][:japanese] = value[1]
#   end
#   final_hash
# end
# def get_japanese_emoticon(path, emoticon)
#   load_library(path).each do |key, value|
#     if value [:english] == emoticon
#       return value[:japanese]
#     end
#   end
#   return "Sorry, that emoticon was not found"
# end
# def get_english_meaning(path, emoticon)
#   load_library(path).each do |key, value|
#     if value [:japanese] == emoticon
#       return key
#     end
#   end
#   return "Sorry, that emoticon was not found"
# end


#last attempt before asking for help
# def get_japanese_emoticon(file, emote)
# load_library(file).select do |keys, values| 
#     values.select do |key|
#      if values[key] == emote 
#        return values[:japanese]
#     end
#   end
# end
# end

# def get_japanese_emoticon(file, emote)
#   emoji_hash = load_library(file)
#   emoji_hash.each do |key, value|
#     if value == emote
#       key
#     end
#   end
# end

# def get_japanese_emoticon(file, emote)
#   translation = load_library(file).select do |keys, values| 
#     values.select do |key, value|
#      if values[key] == emote
#       print key
#      end
# end
# end