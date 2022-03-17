class Role < ActiveRecord::Base
    has_many :auditions

    def actors 
      auditions.where(role_id: self).map do |actor|
        actor.actor
      end
    end

    def locations
      auditions.where(role_id: self).map do |location|
        location.location
      end
    end

    def lead
      self.auditions.find_by(hired: true) || "no actor has been hired for this role"
  end

  def understudy
      self.auditions.where(hired: true).second ||  'no actor has been hired for understudy for this role'
  end

end