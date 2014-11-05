class AddUuidToLocalization < ActiveRecord::Migration
  def change
    add_column :localizations, :uuid, :string
  end
end
