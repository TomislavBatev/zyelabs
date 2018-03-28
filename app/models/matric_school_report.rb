class MatricSchoolReport < ApplicationRecord
  validates :school, uniqueness: { scope: :year }
end
