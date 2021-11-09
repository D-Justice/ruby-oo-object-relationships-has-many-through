class Waiter
    attr_reader :name, :experience
    @@all = []
    def initialize(name, experience)
        @name = name
        @experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        sorted = Meal.all.sort {|a, b| b.tip <=> a.tip}
        sorted.first.customer
    end
end