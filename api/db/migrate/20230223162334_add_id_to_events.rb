class AddIdToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :uuid, :uuid
  end
end
