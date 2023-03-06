class CreateSelectedMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :selected_movies do |t|
      t.integer :vote_count, default: 0
      t.references :movie, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
