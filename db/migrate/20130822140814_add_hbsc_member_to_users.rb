class AddHbscMemberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hbsc_member, :boolean, :default => false
  end
end
