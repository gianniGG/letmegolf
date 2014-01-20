class Group < ActiveRecord::Base
  has_and_belongs_to_many :admins, class_name: "User", join_table: "group_admins"
  has_many :users

  validates :name, presence: true, length: { in: 4..20 }, uniqueness: { case_sensitive: false }
  validate :users_only_belong_to_one_group

  before_save { self.admins.compact! }

  def users_only_belong_to_one_group
    if users.any? { |user| user.group }
      errors.add(:users, 'cannot belong to more than one group')
    end
  end

  def self.parse_admins list_of_admins
    return false if list_of_admins.blank?
    admins_listed_by_user = list_of_admins.split(/[\ \, \ \,]/).reject{|x| x==""}.uniq
  end

  def self.saved_admins parsed_admins
    admins_to_save = parsed_admins.map do |usr|
      u = User.find_by_name usr
    end.compact
  end

  def self.invalid_admins parsed_admins
    saved_admins_names = Group.saved_admins(parsed_admins).map{|usr| usr.name }
    invalid_admins = parsed_admins - saved_admins_names
  end

  def total_user_points
    users.sum(:points)
  end

end
