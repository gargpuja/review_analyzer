class AddEmailToBusiness < ActiveRecord::Migration[5.2]
  def change
  	add_column :businesses, :email, :string
  end
end
