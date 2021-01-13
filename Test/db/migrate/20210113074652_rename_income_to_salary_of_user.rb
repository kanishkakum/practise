class RenameIncomeToSalaryOfUser < ActiveRecord::Migration[6.0]
  def change
  	rename_column :user, :income, :salary
  end
end
