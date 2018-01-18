module PriceHelper
    def price(money)
        number_to_currency(money, :unit => "$")
       end
end