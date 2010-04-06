ActiveRecord::Schema.define(:version => 0) do
  create_table :articles, :force => true do |t|
    t.string :title
    t.string :slug
    t.text :text
    t.timestamps
  end

  create_table :users, :force => true do |t|
    t.string :email
    t.string :random_slug
    t.timestamps
  end
end

