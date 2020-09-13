class CreateRtos < ActiveRecord::Migration[6.0]
  def change
    create_table :rtos do |t|
      t.string :name
      t.string :location
      t.string :city
      t.string :state
      t.string :address

      t.timestamps
    end
  end
end
