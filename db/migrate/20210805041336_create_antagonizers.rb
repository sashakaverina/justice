class CreateAntagonizers < ActiveRecord::Migration[6.0]
  def change
    create_table :antagonizers do |t|
      t.string :name

      t.timestamps
    end
  end
end
