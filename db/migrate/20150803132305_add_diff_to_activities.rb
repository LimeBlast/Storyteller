class AddDiffToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.text :diff
    end
  end
end
