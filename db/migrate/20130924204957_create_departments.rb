class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.integer :deptno
      t.string :dname
      t.string :loc

      t.timestamps
    end
  end
end
