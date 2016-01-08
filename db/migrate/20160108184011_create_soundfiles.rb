class CreateSoundfiles < ActiveRecord::Migration
  def change
    create_table :soundfiles do |t|
      t.references :sound, index: true, foreign_key: true
      t.string :file_name
      t.string :content_type
      t.integer :file_size

      t.timestamps null: false
    end
  end
end
