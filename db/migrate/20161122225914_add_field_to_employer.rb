class AddFieldToEmployer < ActiveRecord::Migration
  def change
  	add_column :employers , :mail_sent , :boolean , default: false
  end
end
