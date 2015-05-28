class CreateTakenSurveys < ActiveRecord::Migration
  def change
    create_table :taken_surveys do |t|
      t.references :user, index: true
      t.references :survey, index: true

      t.timestamps null: false
    end
    add_foreign_key :taken_surveys, :users
    add_foreign_key :taken_surveys, :surveys
  end
end
