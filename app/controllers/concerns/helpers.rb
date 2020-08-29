class MyHelpers
    def calc_rating(old_rating,new_rating,no_of_rating)
        total_rating = old_rating * no_of_rating
        numerator = total_rating + new_rating
        denominator = no_of_rating + 1
        return numerator/denominator
    end

end