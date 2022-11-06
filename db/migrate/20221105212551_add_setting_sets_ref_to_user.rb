class AddSettingSetsRefToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :setting_sets, :user, foreign_key: true
  end
end
