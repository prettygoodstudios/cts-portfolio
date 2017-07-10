module SocialTool
   def self.twitter_search
       client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "lok6hltcBUBbLj3QjeEWY7yfa"
        config.consumer_secret     = "2sqb8TMBsc7CXnkAXeJg9WKxV48j7EajRR9WYxqLxxe4mKkluf"
        config.access_token        = "884418783460302848-dcViOZlio6XYLR0yXXcl6jG3vJacIst"
        config.access_token_secret = "Ajyvwpbwe8btKlP655hj82mZNFLjmGAvELwZqn6ddUJ7g"
      end
      client.search("#rails", result_type: "recent").take(6).collect do |tweet|
        "#{tweet.user.screen_name}: #{tweet.text}"
      end
   end
end
