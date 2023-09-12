class Offer < ApplicationRecord
    has_and_belongs_to_many :people
    validates :title, uniqueness: true
end
