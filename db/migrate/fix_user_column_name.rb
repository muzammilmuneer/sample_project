class FixUserColumnName < ActiveRecord::Migration
  def change
    rename_column :orders, :creater_id, :user_id
    # user.first.update_column(:email,"abc")
    # user.first.update_email("abc")
    # if User.where(email: "abc").first.update_column(:email,"abc")
    #   puts "hellow"
    # end
    # user.find_by(email: "abc")
  end
end
