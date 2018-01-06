class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :user, index: true, foreign_key: true
      t.string :address
      t.integer :yardsize
      t.date :date
      t.string :specialrequests
      t.boolean :stripes
      t.boolean :grasstreated
      t.boolean :mulching
      t.boolean :mulchexisting
      t.boolean :newbushestrees
      t.integer :rate
      t.integer :status
      t.boolean :paid
      t.string :notes

      t.timestamps null: false
    end
  end
end
