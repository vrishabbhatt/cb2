class AddMoreFieldsToEmployer < ActiveRecord::Migration
  def change
  	add_column :employers , :details_filled , :boolean , default: false
  	add_column :employers , :is_verified , :boolean , default: false
  end
end
