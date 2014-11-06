class RemoveUuidFromLocale < ActiveRecord::Migration
  def change
    remove_column :locales, :uuid
  end
end
