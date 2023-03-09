class ChangeReleaseDateInSelectedMovies < ActiveRecord::Migration[7.0]
  def change
    change_column :selected_movies, :release_date, :string
  end
end
