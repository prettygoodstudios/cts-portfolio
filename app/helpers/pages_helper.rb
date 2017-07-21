module PagesHelper
  def twitter_parser tweet
    regex = %r{
      \b
      (
        (?: [a-z][\w-]+:
         (?: /{1,3} | [a-z0-9%] ) |
          www\d{0,3}[.] |
          [a-z0-9.\-]+[.][a-z]{2,4}/
        )
        (?:
         [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
        )+
        (?:
          \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
          [^\s`!()\[\]{};:'".,<>?«»“”‘’]
        )
      )
    }ix
    
    tweet = tweet.gsub(regex) do |url|
      "<a href='#{url}' target='_blank'>#{url}</a>"
    end.html_safe
    tweet_text = ""
    tweet.split(':').drop(1).each do |content|
      tweet_text += content + ":"
    end
    tweet_text.chop!
    final_text = tweet_text
    tweet_text.split('#').each do |hash|
      temp = ""
      if(hash.split(' ')[0] != nil)
        temp = "<a href='https://mobile.twitter.com/search?q=%23#{hash.split(' ')[0].chomp(".").chomp(":")}&src=typeahead_click' style='display:inline;'>##{hash.split(' ')[0]}</a>"
      end
      hash.split(' ').drop(1).each do |words|
        temp += " #{words}"
      end
      final_text += temp
    end
    everything = ""
    final_text.split('@').each do |ref|
      temp2 = "<a href='https://mobile.twitter.com/#{ref.split(' ')[0].chomp(".").chomp(":")}'>@#{ref.split(' ')[0]}</a>"
      ref.split(' ').drop(1).each do |word2|
        temp2 += " #{word2}"
      end
      everything += temp2
    end
    "<img src='https://twitter.com/#{tweet.split(':')[0]}/profile_image?size=original' height='50' width='50' style='border-radius:50%;display: inline-block;margin:0px;'><a href='https://mobile.twitter.com/#{tweet.split(':')[0]}' style='display: inline-block;margin:0px;'>#{tweet.split(':')[0]}</a>#{everything}".html_safe
  end
end
