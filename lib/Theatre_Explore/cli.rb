class Theatre_Explore::CLI
    def call
        puts "Welcome to Theatre Explore!"
        puts "\nHow would you like to search?"

        display_options
    end

    def display_options
        puts "
        1) Productions by year
        2) Productions by venue
        3) Productions by show title
        or type 'Exit' to end the program. \n"
        prompt_select
    end

    def prompt_select
        puts
        puts "Input the corresponding number for your selection." 
        input = ''
        until input == 'exit'
        input = gets.strip.downcase
            case input
            when "1"
                puts "What year would you like to explore?"
                year = gets.strip
                Year.exist?(year) ? nil : YearScraper.new(year)
                Year.print(year)
            when "2"
                puts "What venue would you like to explore?"
            when "3"
                puts "What show would you like to explore?"
            when 'exit'
                goodbye
                
            else
                puts "I'm not sure what you want."
                display_options
            end
        end
    end

    def goodbye
        system("clear")
        puts "Thanks for exploring!"
        puts "Goodbye!"
        exit
    end

end