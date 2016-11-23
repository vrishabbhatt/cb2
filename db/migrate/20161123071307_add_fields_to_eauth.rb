class AddFieldsToEauth < ActiveRecord::Migration
  def change
  	add_column :eauths , :employer_id , :int , default: nil
  	add_column :eauths , :auth_code , :string , default: nil
  end
end
