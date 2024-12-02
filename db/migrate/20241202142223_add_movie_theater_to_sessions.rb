class AddMovieTheaterToSessions < ActiveRecord::Migration[8.0]
  def change
    add_reference :sessions, :movie_theater, null: false, foreign_key: true
  end
end