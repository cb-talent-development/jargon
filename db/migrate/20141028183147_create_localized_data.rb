class CreateLocalizedData < ActiveRecord::Migration
  def change
    create_table :localized_data do |t|
      t.references :localization
      t.string :locale
      t.text :data

      t.timestamps
    end
  end
end
