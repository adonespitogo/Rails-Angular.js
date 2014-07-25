class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # RELATIONSHIPS
  has_and_belongs_to_many :branch_groups,
                            join_table: "admins_branch_groups",
                            dependent: :destroy

  has_and_belongs_to_many :branches,
                            join_table: "branches_employees",
                            foreign_key: "employee_id"

  has_many :activities, class_name: "UserActivity"

  def is_resto_admin?
    self.role == "resto_admin"
  end
end
