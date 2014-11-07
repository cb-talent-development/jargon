class AddOwnerToLocale < ActiveRecord::Migration
  def change
    add_reference :locales, :user, index: true
    add_column :locales, :uuid, :string
  end
end
