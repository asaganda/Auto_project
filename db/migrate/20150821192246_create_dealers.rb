class CreateDealers < ActiveRecord::Migration
  def change
    create_table :dealers do |t|
      t.string :name
      t.string :town
      t.string :state
      t.string :salesperson
      t.string :telephone

      t.timestamps null: false
    end
  end
end
