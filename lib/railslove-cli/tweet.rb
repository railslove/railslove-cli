require "thor"
require "httparty"

module Railslove
  module Cli
    class Tweet < Thor

      desc "list [PAGE]", "gives you some tweets, latest first, you can give it a specific page"
      def list(page = 1)
        tweets = HTTParty.get("http://api.railslove.com/tweets.json?page=#{page}")

        printf(" %-140s %-20s %-15s\n", "text", "published_at", "author_slug")
        puts "-"*180
        tweets["tweets"].each do |tweet|
          printf(" %-140s %-20s %-15s\n", tweet["tweet"]["text"].gsub("\n",""), tweet["tweet"]["published_at"], tweet["tweet"]["author"]["slug"])
        end
        puts "-"*180
      end

    end
  end
end