
class AmountStrategy
        def amount(this_amount, element, base_amount, day_limit=100)
            this_amount += base_amount
            this_amount += (element.days_rented - day_limit) * 1.5 if element.days_rented > day_limit
            this_amount
        end
end
class AmountStrategyRegular < AmountStrategy
        def amount(this_amount, element)
            super(this_amount, element, 2, 2)
        end
end
class AmountStrategyChildren < AmountStrategy
        def amount(this_amount, element)
            super(this_amount, element, 1.5, 3)
        end
end
