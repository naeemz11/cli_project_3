
class Cli

    @@topics = ["tesla stock", "amazon stock", "disney stock", "amd stock", "apple"]

    def start 
        
        puts "
        ░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗
        ░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝
        ░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░
        ░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░
        ░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗
        ░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝\r\n".cyan

        puts "Please select one of the following topics:".bold
        self.display_topics
        index = self.initial_input
        query = Cli.topics[index]
        api = Api.new(query)
        api.create_articles
        Article.display_articles

        index = self.secondary_input
        Article.display_article(index) 
        Article.view_article_in_browser?
        self.another_article?
        #binding.pry
    end 
    

    def self.topics
        @@topics
    end 

    def display_topics 
        Cli.topics.each_with_index{|topic, index| puts "#{index +1}".bold + "." + "#{topic.capitalize}".bold.green}
    end 

    def input_to_index(input)
        input.to_i - 1 
    end 

    def initial_input
        input= gets.chomp 
        index = input_to_index(input)
        if !index.between?(0,4)
            puts "Please select articles between 1 and 5.".red
            self.initial_input
        end 
        index
    end 

    def secondary_input
        input= gets.chomp 
        index = input_to_index(input)
        if !index.between?(0,9)
            puts "Please select articles between 1 and 10".red
            self.secondary_input
        end 
        index
    end 

    def another_article?
        puts "Would you like to read another article?".bold
        puts "1.".bold + "Yes".bold.green
        puts "2.".bold + "No".bold.light_red
        input = gets.chomp
        index = input_to_index(input)
        
        if index == 0 
            Article.clear_all
            self.start 
        end 
    end 

   
end 


# 4/2. [amazon,amd] stock provides 20 articles when it was supposed provide no more than 10