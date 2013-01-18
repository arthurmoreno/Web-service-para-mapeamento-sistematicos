class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
			t.string :state
			t.string :city
			t.string :area_code
			t.string :time_zone
      t.timestamps
    end
  end
end
