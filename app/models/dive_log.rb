# == Schema Information
#
# Table name: dive_logs
#
#  id                                           :bigint           not null, primary key
#  air_remaining(Remaining air pressure in bar) :integer
#  average_depth                                :float
#  date                                         :date             not null
#  dive_number                                  :integer          not null
#  entry_time                                   :string
#  equipment                                    :text
#  exit_time                                    :string
#  guide_name                                   :string
#  max_depth                                    :float
#  max_temp                                     :float
#  memo                                         :text
#  min_temp                                     :float
#  point_name(Dive point name)                  :string
#  shop_name(Dive shop name)                    :string
#  spot_name                                    :string           not null
#  tank_capacity(Tank capacity in liters)       :integer
#  tank_material(0: steel, 1: aluminum)         :integer          default(NULL)
#  visibility(Visibility in meters)             :integer
#  weight                                       :float
#  created_at                                   :datetime         not null
#  updated_at                                   :datetime         not null
#  user_id                                      :bigint           not null
#
# Indexes
#
#  index_dive_logs_on_dive_number_and_user_id  (dive_number,user_id) UNIQUE
#  index_dive_logs_on_user_id                  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class DiveLog < ApplicationRecord
  belongs_to :user

  enum :tank_material, { steel: 1, aluminum: 2 }

  validates :dive_number,
    presence: true,
    numericality: { only_integer: true },
    uniqueness: { scope: :user_id }

  validates :spot_name, presence: true
  validates :date, presence: true
  validates :user_id, presence: true
end
