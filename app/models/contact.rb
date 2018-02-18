class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true 
  validates :email, format: { with: /\A.{2,}@\w{2,}[.][a-zA-Z]{2,3}\z/, message: "must be an email"}

  def friendly_updated_at
    updated_at.strftime("%b %d, %Y")
  end
  def full_name 
    full_name = "#{first_name} #{middle_name} #{last_name}".titleize
  end
  def japan_number
    japan_phone_number = "81 + #{phone_number}"
  end
  def bio_list
    if bio != nil
    bio.split(", ")
    else
    bio 
    end  
  end
  def as_json
    {
      id: self.id,
      full_name: self.full_name,
      first_name: self.first_name,
      middle_name: self.middle_name, 
      last_name: self.last_name,
      bio: self.bio_list,
      email: self.email,
      phone_number: self.phone_number,
      japan_number: self.japan_number,
      updated_at: self.friendly_updated_at

    }
  end
end
