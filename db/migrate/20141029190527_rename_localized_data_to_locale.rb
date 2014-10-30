class RenameLocalizedDataToLocale < ActiveRecord::Migration
  def change
    rename_table :localized_data, :locales
  end
end
