class CreateTakenSurveys < ActiveRecord::Migration
  def change
    create_table :taken_surveys do |t|
      t.references :user, index: true
      t.references :survey, index: true

      t.timestamps null: false
    end
  end
end
