class Person < ApplicationRecord
    has_and_belongs_to_many :offers
    def person_params
        params.require(:offer).permit(:name, :age, :city, :offer_ids => [])
       end
end
