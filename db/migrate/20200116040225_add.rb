class Add < ActiveRecord::Migration[5.2]
  def change
  	add_column :locations ,:review_count,:integer
  	add_column :locations ,:place_id,:string
  	add_column :locations ,:address ,:string
  end
end
