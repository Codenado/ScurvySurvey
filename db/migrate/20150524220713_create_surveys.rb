class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.boolean :published
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :surveys, :users
  end
end
