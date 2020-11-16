class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table   :items do |t|
      t.references :user,             null: false
      t.string     :name,             null: false
      t.text       :description,      null: false
      t.integer    :category_id,      null: false
      t.integer    :condetion_id,     null: false
      t.integer    :postage_payer_id, null: false
      t.integer    :prefectre_id,     null: false
      t.integer    :handling_time_id, null: false
      t.integer    :price,            null: false
      t.timestamps
    end
  end
end
