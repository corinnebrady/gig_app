class ChangeAddressToStreetColumnInEventsTable < ActiveRecord::Migration
  def change
    rename_column :events, :address, :street
  end
end
