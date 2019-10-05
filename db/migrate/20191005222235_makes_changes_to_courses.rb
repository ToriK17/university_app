class MakesChangesToCourses < ActiveRecord::Migration[6.0]
  def change
    rename_column :courses, :type, :department 
  end
end
