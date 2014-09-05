class ChangeColumnArticleTypeToArticles < ActiveRecord::Migration
  def change
    change_column :articles, :article_type, :type, default: "article"
  end
end
