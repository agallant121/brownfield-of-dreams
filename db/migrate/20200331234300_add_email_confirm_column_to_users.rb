# rubocop:todo Style/Documentation
# frozen_string_literal: true

class AddEmailConfirmColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email_confirmed, :boolean, default: false
    add_column :users, :confirm_token, :string
  end
end
# rubocop:enable Style/Documentation
