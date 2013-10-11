class CreateAppThemes < ActiveRecord::Migration
  def change
    create_table :app_themes do |t|
      t.string :primary_color, null: false
      t.string :secondary_color, null: false
      t.string :welcome_splash_url, null: false
      t.string :video_splash_url, null: false
      t.string :welcome_text, null: false
      t.integer :app_id

      t.timestamps
    end
  end
end
