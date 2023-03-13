class ChangeAcceptedDefaultInInvitations < ActiveRecord::Migration[7.0]
  def change
    change_column :invitations, :accepted, :string, :default => "Pending"
  end
end
