class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.references :choice, index: true

      t.timestamps null: false
    end
  end
end
