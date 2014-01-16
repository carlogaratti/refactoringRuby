class FrequentRenter

        def sum(frequent_renter_points, element)
            frequent_renter_points += 1
            if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
                frequent_renter_points += 1
            end
            frequent_renter_points
        end
end
