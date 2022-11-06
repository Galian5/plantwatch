class Setting < ApplicationRecord
  belongs_to :plant

  def setting_set
    @setting = SettingSet.all
  end
end
