class AddLastNameToNames < ActiveRecord::Migration[5.2]
  def change
    add_column :names, :last_name, :string
  end
end
