class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :email
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
