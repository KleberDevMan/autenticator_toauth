class RemoveDescFromNames < ActiveRecord::Migration[5.2]
  def change
    remove_column :names, :desc, :string
  end
end
