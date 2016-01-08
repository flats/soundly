class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
