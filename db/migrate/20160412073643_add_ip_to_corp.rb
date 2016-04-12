class AddIpToCorp < ActiveRecord::Migration
  def change
    add_column :corps, :ip, :inet
  end
end
