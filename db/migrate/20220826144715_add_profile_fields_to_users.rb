# frozen_string_literal: true

class AddProfileFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :user_name, null: false
      t.string :user_id, null: false, index: { unique: true }
    end
  end
end
