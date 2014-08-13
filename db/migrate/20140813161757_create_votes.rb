class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
  		t.references :post, index: true
  		t.references :comment, index: true
      	t.boolean :upvote
      	t.string :unique_id
      	t.timestamps
    end
  end
end
