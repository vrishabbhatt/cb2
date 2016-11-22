class AddFieldsToEmployer < ActiveRecord::Migration
  def change
  	add_column :employers , :name , :string
  	add_column :employers , :email , :string
  	add_column :employers , :dob , :date
  	add_column :employers , :location , :text
  	add_column :employers , :ph_no , :string
  end
end
