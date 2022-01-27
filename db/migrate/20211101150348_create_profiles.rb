class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name, default: [], array: true
      t.string :job_title, default: [], array: true
      t.string :total_experience, default: [], array: true
      t.string :career_highlights, array: true, default: []
      t.text :overview, default: [], array: true
      t.string :primary_skills, array: true, default: []
      t.string :secondary_skills, array: true, default: []

      t.belongs_to :user, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
