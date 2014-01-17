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
        result = "Rental Record for #{@name} "
        @rentals.each do |aRental|
            result += aRental.movie.title + " " 
        end

        result += "Amount owned is #{total_charge} "
        result += "You earned #{total_renter_points} frequent renter points"
        result
    end

    def total_charge
        @rentals.inject(0) { |sum, rental| sum + rental.charge }
    end

    def total_renter_points
        @rentals.inject(0) { |sum, rental| sum + rental.freq_renter_points }
    end
end

