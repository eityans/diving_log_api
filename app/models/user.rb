# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  sub        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_sub  (sub) UNIQUE
#
class User < ApplicationRecord
  has_many :dive_logs, dependent: :destroy
end
