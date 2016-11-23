class CreateEauths < ActiveRecord::Migration
  def change
    create_table :eauths do |t|

      t.timestamps null: false
    end
  end
end
