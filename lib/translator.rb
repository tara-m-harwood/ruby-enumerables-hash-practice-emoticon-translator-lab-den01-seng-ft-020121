# require modules here
require "yaml"
require "pry"

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = {}
  emoticons.each do | meaning, emoji |
   emoticon_hash[meaning.to_s] = { :english => emoji[0], :japanese => emoji[1]}
  end
 # binding.pry
  emoticon_hash
end


def get_english_meaning(path, japan)
    emoji_dict = load_library(path)
    eng_meaning = ''
    emoji_dict.each do | meaning, lang |
      # p emoji_dict[meaning][:japanese]
      if emoji_dict[meaning][:japanese] == japan
        eng_meaning = meaning
      end  
    end
   #binding.pry
   if eng_meaning == ''
     eng_meaning = "Sorry, that emoticon was not found"
   end   
   eng_meaning
end   

def get_japanese_emoticon(path, english)
    emoji_dict = load_library(path)
    japan_emoji = ''
    emoji_dict.each do | meaning, lang |
      if emoji_dict[meaning][:english] == english
        japan_emoji = emoji_dict[meaning][:japanese]
      end  
    end
   #binding.pry
   if japan_emoji == ''
     japan_emoji = "Sorry, that emoticon was not found"
   end   
   japan_emoji
end 

# get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)")
# test_hash("./lib/emoticons.yml", "(Ｔ▽Ｔ)")