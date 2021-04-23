class Recommendation < ApplicationRecord
    belongs_to :user
    belongs_to :tv_movie
end
