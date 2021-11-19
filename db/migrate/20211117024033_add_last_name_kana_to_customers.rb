class AddLastNameKanaToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :last_name_kana, :string
    add_column :customers, :first_name, :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :postal_code, :string
    add_column :customers, :address, :string
    add_column :customers, :phone_number, :string
  end
end
