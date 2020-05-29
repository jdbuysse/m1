class Concept < ActiveRecord::Base
    belongs_to :lesson, -> { includes :student }
end