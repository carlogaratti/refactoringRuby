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
        total_amount, frequent_renter_points = 0,0 
        result = "Rental Record for #{@name} "
        @rentals.each do |element|
            this_amount = 0
            case element.movie.price_code
            when Movie::REGULAR
                this_amount += 2
                this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
            when Movie::NEW_RELEASE
                this_amount += 2
            when Movie::CHILDRENS
                this_amount += 1.5
                this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
            end

            frequent_renter_points += 1
            if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
                frequent_renter_points += 1
            end
            result += element.movie.title + " " 
            total_amount = + this_amount
        end

        result += "Amount owned is #{total_amount} "
        result += "You earned #{frequent_renter_points} frequent renter points"
        result
    end
end
