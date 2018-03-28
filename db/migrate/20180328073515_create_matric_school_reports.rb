class CreateMatricSchoolReports < ActiveRecord::Migration[5.1]
  def change
    create_table :matric_school_reports do |t|
      t.string :school
      t.integer :year
      t.integer :wrote
      t.integer :passed

      t.timestamps
    end
  end
end
