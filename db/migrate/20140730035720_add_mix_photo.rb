class AddMixPhoto < ActiveRecord::Migration
  def change
    add_column :mixes, :mix_photo, :string, null: false
  end
end
