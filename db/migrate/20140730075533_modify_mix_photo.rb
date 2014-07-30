class ModifyMixPhoto < ActiveRecord::Migration
  def change
    change_column :mixes, :mix_photo, :string, null: true
  end
end
