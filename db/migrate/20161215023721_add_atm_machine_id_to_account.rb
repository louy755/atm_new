class AddAtmMachineIdToAccount < ActiveRecord::Migration
  def change
    add_column :transactions, :atm_mac_id, :integer
  end
end
