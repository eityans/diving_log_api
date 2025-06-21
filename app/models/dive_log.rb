# == Schema Information
#
# Table name: dive_logs
#
#  id                               :bigint           not null, primary key
#  average_depth                    :float
#  date                             :date             not null
#  dive_number                      :integer          not null
#  entry_time                       :string
#  equipment                        :text
#  exit_time                        :string
#  guide_name                       :string
#  max_depth                        :float
#  max_temp                         :float
#  memo                             :text
#  min_temp                         :float
#  spot_name                        :string           not null
#  visibility(Visibility in meters) :integer
#  weight                           :float
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  user_id                          :bigint           not null
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

  validates :dive_number,
    presence: true,
    numericality: { only_integer: true },
    uniqueness: { scope: :user_id }

  validates :spot_name, presence: true
  validates :date, presence: true
  validates :user_id, presence: true
end
