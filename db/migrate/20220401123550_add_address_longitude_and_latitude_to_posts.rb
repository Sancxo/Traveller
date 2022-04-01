class AddAddressLongitudeAndLatitudeToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :address, :string
    add_column :posts, :longitude, :float
    add_column :posts, :latitude, :float
  end
end
