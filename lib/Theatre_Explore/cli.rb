class Theatre_Explore::CLI
    def call
        system("clear")
        puts "
        =====================================
        ||   Welcome to Theatre Explore!   ||
        =====================================
        "
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
        puts ""
        puts "Input the corresponding number for your selection." 
        input = ''
        until input == 'exit'
            input = gets.strip.downcase
            case input
            when "1"
                system("clear")
                year_input
            when "2"
                system("clear")
                show_input
            when 'exit'
                goodbye
            else
                unclear
            end
        end
    end

    def unclear
        system("clear")
        puts "I'm not sure what you want."
        sleep(1)
        system("clear")
        display_options
    end

    def year_input
        puts "========================"
        puts "What year would you like to explore?"
        puts "I can pull records dating back to 1832."
        puts "========================"
        puts ""
            input = gets.strip
                if Year.valid?(input)
                    year = Year.find_or_create(input)
                    year.print
                    puts "========================"
                    puts "Please enter the number of the production you wish to explore."
                    choice = gets.strip.to_i
                    Production.create_from_year(year, choice)
                    system("clear")
                    year.select_production(choice).print
                    repeat_prompt
                else
                    system("clear")
                    puts "========================"
                    puts "\n I'm sorry, that year is invalid."
                    puts "========================"
                    sleep(1)
                    system("clear")
                    display_options
                end
    end
    #This likely needs to be refactored
    def show_input
        puts "===================================="
        puts "What show would you like to explore?"
        puts "===================================="
        puts ""
            input = gets.strip
            list = show_search(input)
        system("clear")
        if list.keys.size < 1
            puts "I'm sorry, there doesn't seem to be a show with that title."
            sleep(1)
            repeat_prompt
        else    
            list.keys.each.with_index(1) {|k,i| puts "#{i}) #{k}"}
        end
        puts "What production would you like to learn more about?"
        puts ""
            input = gets.strip.to_i
            if input.between?(1,list.keys.size)
                Scraper.new('show', list[list.keys[input-1]])
            else
                system("clear")
                puts "I'm not sure what you want."
                sleep(1)
                system("clear")
                repeat_prompt
            end
        system("clear")
        Production.all.last.print
        repeat_prompt
    end

    def show_search(input)
        result = Scraper.new("search", input)
            list = {}
            results = result.page.search("td span")
                results.each do |production|
                    list[production.text] = "https://www.broadwayworld.com#{production.children.at("a").attribute("href").value}"
                end
        list
    end

    def repeat_prompt
        puts ""
        puts "Would you like to explore more? (Yes or No)"
        input = gets.strip.downcase
        case input
        when "yes", "y"
            system("clear")
            display_options
        when "no", "n"
            goodbye
        else
            unclear
        end
    end

    def goodbye
        system("clear")
        puts "==========================="
        puts "|| Thanks for exploring! ||"
        puts "---------------------------"
        puts "||        Goodbye!       ||"
        puts "==========================="
        exit
    end

end