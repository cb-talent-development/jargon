class AddOwnerToLocalizations < ActiveRecord::Migration
  def change
    add_reference :localizations, :user, index: true
  end
end
