class Customer
    attr_accessor :meal, :age
    @@all = []
    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, price, tip)
        meal = Meal.new(waiter, self, price, tip)
    end
    def meals
        Meal.all.select {|meal| meal.customer == self}
    end
    def waiters
        Meal.all.select {|meal| meal.customer == self}.collect {|each| each.waiter}
    end
end