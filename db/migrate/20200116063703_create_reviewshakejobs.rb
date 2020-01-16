class CreateReviewshakejobs < ActiveRecord::Migration[5.2]
  def change
    create_table :reviewshakejobs do |t|
      t.string :job_id
      t.boolean :status
      t.string :state_status
      t.references :locations, foreign_key: true

      t.timestamps
    end
  end
end
