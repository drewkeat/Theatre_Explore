class Show
    attr_accessor :label, :type, :productions
    
    @@all = []
    
    def initialize(label, type)
        @label = label
        @type = type
        @productions = []
        self.save
    end

    def print
        puts "========================"
        puts "#{@label}"
        puts "========================"
        puts "list of productions"
    end

    def self.all
        @@all
    end

    def self.find(label)
        @@all.detect {|ele| ele.label == label}
    end

    def save
        @@all << self
    end
end

#Initialize with "Type" information