class CreateOutingInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :outing_invites do |t|
      t.integer :inviter_id
      t.integer :invitee_id
      t.integer :outing_id

      t.timestamps
    end
  end
end
