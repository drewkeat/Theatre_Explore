class Theatre_Explore::CLI
    def clear_term
        system("clear")
    end

    def call
        clear_term
        puts "Welcome to Theatre Explore!"
        puts "\nHow would you like to search?"

        display_options
    end

    def display_options
        puts "
        1) Productions by year \n
        2) Productions by show title \n"
        puts ""
        puts "\t\t**Or type 'Exit' to end the program.** \n"
        main_prompt
    end

    def main_prompt
        puts
        puts "Input the corresponding number for your selection." 
        input = ''
        until input == 'exit'
            input = gets.strip.downcase
            case input
            when "1"
                clear_term
                year_input
            when "2"
                clear_term
                puts "Right On!"
                puts "========================"
                puts "What show would you like to explore?"
            when 'exit'
                goodbye
                
            else
                puts "I'm not sure what you want."
                display_options
            end
        end
    end

    def year_input
        puts "Excellent!"
        puts "========================"
        puts "What year would you like to explore?"
            year = gets.strip
                if Year.exist?(year)
                    inst = Year.find(year)
                    inst.print
                    # puts "========================"
                    # puts "Enter the number of the production you wish to explore"
                    # choice = gets.strip
                    # show_select(inst,choice)
                elsif Year.valid?(year)
                    YearScraper.new(year)
                    inst = Year.find(year)
                    inst.print
                    # puts "========================"
                    # puts "Enter the number of the production you wish to explore"
                    # choice = gets.strip
                    # inst.production(choice)
                else
                    clear_term
                    puts "\n I'm sorry, that year is invalid."
                    puts "Would you like to try again?\n"
                    display_options
                end
    end

    def goodbye
        system("clear")
        puts "Thanks for exploring!"
        # binding.pry
        puts "Goodbye!"
        exit
    end

end