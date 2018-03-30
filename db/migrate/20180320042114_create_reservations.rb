class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.belongs_to :user
      t.belongs_to :listing
      t.datetime :appointment_date
      t.timestamps
    end
  end
end
