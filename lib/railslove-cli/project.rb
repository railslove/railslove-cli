require "thor"
require "httparty"

module Railslove
  module Cli
    class Project < Thor

      desc "list", "gives you all information about the team members"
      def list
        projects = HTTParty.get("http://api.railslove.com/projects.json")

        printf(" %-28s %-33s %-15s\n", "slug", "name", "project_type")
        puts "-"*77
        projects["projects"].each do |project|
          printf(" %-28s %-33s %-15s\n", project["project"]["slug"], project["project"]["name"], project["project"]["project_type"])
        end
        puts "-"*77
      end

      desc "show SLUG", "view more details about a single project"
      def show(slug)
        project = HTTParty.get("http://api.railslove.com/projects/#{slug}.json")

        people = project["project"].delete("people")
        images = project["project"].delete("images")
        links  = project["project"].delete("links")
        description  = project["project"].delete("description")

        puts "#{description}\n\n"
        project["project"].each do |k,v|
          printf("%14s: %s\n", k, v)
        end

      end

    end
  end
end


