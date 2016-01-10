class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :follower, index: true, foreign_key: true
      t.references :leader, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
