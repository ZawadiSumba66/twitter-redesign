class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :Username
      t.string :FullName
      
      t.timestamps
    end
  end
end
