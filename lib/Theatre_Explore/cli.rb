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
        3) Productions by show title"
        puts "\nSelect 1-3"
    end
end