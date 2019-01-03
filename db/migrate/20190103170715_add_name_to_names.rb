class AddNameToNames < ActiveRecord::Migration[5.2]
  def change
    add_column :names, :name, :string
  end
end
