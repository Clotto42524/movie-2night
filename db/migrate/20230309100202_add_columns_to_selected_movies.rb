class AddColumnsToSelectedMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :selected_movies, :title, :string
    add_column :selected_movies, :overview, :string
    add_column :selected_movies, :release_date, :date
    add_column :selected_movies, :genre, :string
    add_column :selected_movies, :poster_path, :string
  end
end
