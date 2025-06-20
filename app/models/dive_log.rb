# == Schema Information
#
# Table name: dive_logs
#
#  id            :bigint           not null, primary key
#  average_depth :float
#  date          :date
#  dive_number   :integer          not null
#  entry_time    :time
#  equipment     :text
#  exit_time     :time
#  guide_name    :string
#  max_depth     :float
#  max_temp      :float
#  min_temp      :float
#  spot_name     :string           not null
#  weight        :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
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
  validates :dive_number, presence: true
  validates :spot_name, presence: true
  validates :user_id, presence: true
end
