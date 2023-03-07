class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.integer :release_date
      t.string :genre
      t.string :poster_path
      t.float :vote_average
      t.string :original_title
      t.string :original_language

      t.timestamps
    end
  end
end
