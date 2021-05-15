class Year
    attr_accessor :label, :productions, :display_list
    @@all = []

    def initialize(label, list)
        @label = label
        @display_list = list
        @productions = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def create_production(choice)
        url = @display_list[@display_list.keys[choice-1]]
        Scraper.new("show", url)
    end

    def self.find(year)
        @@all.detect {|ele| ele.label == year}
    end

    def self.valid?(year)
        year.to_i > 1832
    end

    def print
        self.display_list.keys.each.with_index(1) {|show, i| puts "#{i}. #{show}"}
    end

    def print_production(input)
        show = self.display_list.keys[input - 1]
        production = productions.detect {|e| e.label = show}
        production.print
    end
end