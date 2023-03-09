class RemoveGenreFromSelectedMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :selected_movies, :genre
  end
end
