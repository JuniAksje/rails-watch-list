class AddPosterUrlAndRatingToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :poster_url, :string
    add_column :movies, :rating, :float
  end
end
