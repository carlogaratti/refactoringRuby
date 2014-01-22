@orders = [1, 2, 3, 4]

def print
    total = 1
    ##print banner
    puts 'bannertitle'

    @orders.each do |order|
        total += order
    end

end
