class AddTypeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :article_type, :string, :default => "article"
  end
end
