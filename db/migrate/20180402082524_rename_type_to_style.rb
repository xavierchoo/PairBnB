class RenameTypeToStyle < ActiveRecord::Migration[5.1]
  def change
  	rename_column :listings, :type, :style
  end
end
