class RenameLocaleToName < ActiveRecord::Migration
  def change
    rename_column :locales, :locale, :name
  end
end
