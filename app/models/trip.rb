class Trip < ApplicationRecord
  validates :start, length: {minimum: 3}
  validates :end, length: {minimum: 3}
  validates :link, uniqueness: true,
                   length: {minimum: 10},

  #validates :link, length: {minimum: 10}
  validates :length, numericality: {greater_than_or_equal_to: 500,
                                    less_than_or_equal_to: 2500,
                                    only_integer: true}
end
