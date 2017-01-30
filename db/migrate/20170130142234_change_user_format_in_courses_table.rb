class ChangeUserFormatInCoursesTable < ActiveRecord::Migration[5.0]
  def change
    change_column :courses, :autor, :integer
  end
end
