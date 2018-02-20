class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    # drop_table :tweets
    create_table :tweets do |t|
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
