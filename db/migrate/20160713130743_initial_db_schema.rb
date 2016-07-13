class InitialDbSchema < ActiveRecord::Migration
  def change
  	create_table :jobs do |t|
  		t.string :name
  		t.text :description
  		t.integer :budget
  		t.string :location
  		t.boolean :expired, default: false
  		t.timestamps
  	end

  	create_table :categories do |t|
  		t.string :name
  	end

  	create_table :skills do |t|
  		t.string :name
  	end

  	add_reference :jobs, :category, index: true
  end
end
