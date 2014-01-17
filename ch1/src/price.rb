
module Price
    def frequent_renter_points(days_rented)
        1
    end
end

class RegularPrice
   
    include Price

    def charge(days_rented)
        result = 2
        result += (days_rented - 2) * 1.5 if days_rented > 2
        result
    end
end

class NewReleasePrice
    def charge(days_rented)
        2
    end

    def frequent_renter_points(days_rented)
        2
    end
end

class ChildrenPrice

    include Price

    def charge(days_rented)
        result = 1.5
        result += (days_rented - 3) * 1.5 if days_rented > 3
        result
    end
end

