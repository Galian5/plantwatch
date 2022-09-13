class AddUriAddressToDevices < ActiveRecord::Migration[5.2]
  def change
    add_column(:devices, :uri_address, :string)
  end
end
