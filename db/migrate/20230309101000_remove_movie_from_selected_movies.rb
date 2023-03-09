class RemoveMovieFromSelectedMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :selected_movies, :movie_id
  end
end
