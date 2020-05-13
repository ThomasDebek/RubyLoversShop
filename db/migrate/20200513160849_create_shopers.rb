class CreateShopers < ActiveRecord::Migration[6.0]
  def change
    create_table :shopers do |t|
      t.string :name

      t.timestamps
    end
  end
end
