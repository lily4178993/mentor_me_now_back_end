class CreateMentors < ActiveRecord::Migration[7.1]
  def change
    create_table :mentors do |t|
      t.string :name
      t.string :occupation
      t.text :about
      t.decimal :hourly_fee, precision: 10, scale: 5
      t.integer :year_of_experience, default: 0
      t.string :location
      t.string :skills
      t.string :photo_url

      t.timestamps
    end
  end
end
