class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :models do |t|
      t.belongs_to :brand, foreign_key: true
      t.string :model_nm
      t.string :gen
      t.datetime :released_at
    end
  end
end
