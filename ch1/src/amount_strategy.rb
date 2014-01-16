
class AmountStrategy
        def amount(element, base_amount, day_limit=100)
            base_amount += (element.days_rented - day_limit) * 1.5 if element.days_rented > day_limit
            base_amount
        end
end
class AmountStrategyRegular < AmountStrategy
        def amount(element)
            super(element, 2, 2)
        end
end
class AmountStrategyChildren < AmountStrategy
        def amount(element)
            super(element, 1.5, 3)
        end
end
