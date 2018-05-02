class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name, null: false #will not allow row to be inserted into this PeopleTable if the entry doesn't have a name
      t.integer :house_id, null: false
      #t.timestamps #two columns in practice: creates a create at column and updated at column
    end
  end
end
