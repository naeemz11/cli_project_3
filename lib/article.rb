
class Article 

     attr_accessor :title, :author, :url, :content  

    @@all = []

    def initialize(title,author,url,content)
        @title = title
        @author = author
        @url = url
        @content = content
        @@all << self 

    end 

    def self.all
        @@all 
    end 

    def self.clear_all
        @@all = []
    end 

    def self.display_articles 
        puts "Please choose one of the following articles:".bold
        self.all.each_with_index{|article, index| puts "#{index +1}".bold + "." + "#{article.title}".light_green.bold}
    end 

    def self.display_article(index) #displays single article 
        article = self.all[index]
        puts "#{article.title}".bold.green + "--" + "#{article.author}".blue.bold
        puts "#{article.content}".light_cyan

    end 

    def self.view_article_in_browser?
        puts "Would you like to view the full article in the browser?".bold
        puts "1.".bold + "Yes".bold.green
        puts "2.".bold + "No".bold.light_red

        input = gets.chomp
        index = input.to_i - 1
        
        if index == 0 
        
            #binding.pry
            Launchy.open("#{self.all[index].url}")  
        else 
            puts "Please select 1 or 2".red
            self.view_article_in_browser?
         end 
    
        
    end 


end 