class AddImageToSpots < ActiveRecord::Migration[5.1]
  def change
    add_column :spots, :image, :string
  end
end
