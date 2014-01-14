class Group < ActiveRecord::Base

  before_save { self.points = 0 }

  has_many :users

  validates :name, presence: true, length: { in: 4..20 }, uniqueness: { case_sensitive: false }
  validate :users_only_belong_to_one_group

  def users_only_belong_to_one_group
    if users.any? { |user| user.group }
      errors.add(:users, 'cannot belong to more than one group')
    end
  end

  def self.parse_admins(list_of_admins)
    return false if list_of_admins.blank?

    admins_listed_by_user = list_of_admins.split(/[\ \, \ \,]/).reject{|x| x==""}.uniq

    admins_to_save = admins_listed_by_user.map do |usr|
      User.find_by_name(usr)
    end

    admins_to_save.compact
  end


  def total_user_points
    users.sum(:points)
  end


end
