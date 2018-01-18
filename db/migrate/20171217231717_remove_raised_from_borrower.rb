class RemoveRaisedFromBorrower < ActiveRecord::Migration
  def change
    remove_column :borrowers, :raised
  end
end
