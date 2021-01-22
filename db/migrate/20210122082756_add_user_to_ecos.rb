class AddUserToEcos < ActiveRecord::Migration[5.2]
  def change
    add_reference :ecos, :user, foreign_key: true
  end
end
