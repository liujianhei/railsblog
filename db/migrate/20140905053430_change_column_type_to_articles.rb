class ChangeColumnTypeToArticles < ActiveRecord::Migration
  change_table :articles do |t|
    t.rename :type, :article_type
  end
end
