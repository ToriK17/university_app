class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.integer :num
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
