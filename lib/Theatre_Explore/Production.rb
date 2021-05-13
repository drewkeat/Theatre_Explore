class Production
    attr_accessor :show, :label #:details, :cast, :crew
    @@all = []
    def initialize(show, label)
        @show = show
        @label = label
        create_show(show)
        self.save
    end

    def self.all
        @@all
    end

    def self.find(label)
        @@all.detect {|p| p.label == label}
    end

    def save
        @@all << self
    end

    def create_show(show)
        if Show.find(show)
            Show.find(show).productions << self
        else
            s = Show.new(show)
            s.productions << self
        end
    end
end