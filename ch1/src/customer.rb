class Customer
    attr_reader :name

    def initialize(name)
        @name = name
        @rentals = []
    end

    def add_rental(args)
        @rentals << args
    end

    def statement
        frequent_renter_points = 0 
        result = "Rental Record for #{@name} "
        @rentals.each do |aRental|
            result += aRental.movie.title + " " 
            frequent_renter_points += aRental.freq_renter_points
        end

        result += "Amount owned is #{total_charge} "
        result += "You earned #{frequent_renter_points} frequent renter points"
        result
    end

    def total_charge
        @rentals.inject(0) { |sum, rental| sum + rental.charge }
    end
end

