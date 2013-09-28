class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :empno
      t.string :ename
      t.string :job
      t.integer :mgr
      t.date :hiredate
      t.decimal :sal
      t.decimal :comm
      t.integer :deptno
      t.timestamps
    end
  end
end
