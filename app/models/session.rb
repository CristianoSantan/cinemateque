class Session < ApplicationRecord
  belongs_to :movie_theater
  belongs_to :movie
  belongs_to :room

  enum :date, { 
    :sunday => 0,
    :monday => 1,
    :tuesday => 2,
    :wednesday => 3,
    :thursday => 4,
    :friday => 5,
    :saturday => 6
  }
  
end
