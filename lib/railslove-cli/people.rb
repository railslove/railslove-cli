require "thor"
require "httparty"

module Railslove
  module Cli
    class People < Thor

      desc "list", "gives you all information about the team members"
      def list
        team = HTTParty.get("http://api.railslove.com/people.json")

        printf(" %-24s %-15s %-15s %-20s %-10s\n", "slug", "first_name", "last_name", "twitter", "family")
        puts "-"*85
        team["people"].each do |member|
          printf(" %-24s %-15s %-15s %-20s %-20s\n", member["person"]["slug"], member["person"]["first_name"], member["person"]["last_name"], member["person"]["twitter_name"], member["person"]["family_status"])
        end
        puts "-"*85
      end

      desc "show SLUG", "view more details about a single team member"
      def show(slug)
        person = HTTParty.get("http://api.railslove.com/people/#{slug}.json")

        description = person["person"].delete("description")
        links = person["person"].delete("links")

        person["person"].each do |k,v|
          printf("%17s: %s\n", k, v)
        end
      end

    end
  end
end