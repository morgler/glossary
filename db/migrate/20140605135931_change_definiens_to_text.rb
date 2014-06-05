class ChangeDefiniensToText < ActiveRecord::Migration
  def change
    change_column :definitions, :definiens, :text
  end
end
