class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :empno
      t.string :ename
      t.integer :deptno

      t.timestamps
    end
  end
end
