class AddRemoveToMentors < ActiveRecord::Migration[7.1]
  def change
    add_column :mentors, :remove, :boolean, default: false
  end
end
