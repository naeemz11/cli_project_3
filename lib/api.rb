require 'pry'
# require_relative '../environment.rb'
# require_relative 'article.rb'
class Api

    attr_accessor :query

    def initialize(query)
        @query = query
    end 


    

    def fetch_articles
    d = Time.now.strftime("%F")
    url = "http://newsapi.org/v2/everything?q=#{@query}&from=#{d}&sortBy=publishedAt&apiKey=5bbfba089a414adab493866bc5f1256f"

    uri = URI(url)
    response = Net::HTTP.get(uri)
    articles = JSON.parse(response)
    #binding.pry
    articles["articles"][1..10]
    end 

    def create_articles
        self.fetch_articles.each {|article|Article.new(article["title"],article["author"],article["url"],article["content"]) }
    end 

    # system("start #{article.url}")


end 
# api= Api.new("Tesla stock")
   #binding.pry
#  "let us pry"