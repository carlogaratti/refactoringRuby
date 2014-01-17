class Rental
    attr_reader :movie, :days_rented

    def initialize(movie, days_rented)
        @movie, @days_rented = movie, days_rented
    end
    def charge
        movie.charge(days_rented)
    end
    
    def freq_renter_points
        movie.freq_renter_points(days_rented)
    end
end
