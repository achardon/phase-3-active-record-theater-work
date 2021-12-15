require 'pry'

class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map {|n| n.actor}
    end

    def locations
        self.auditions.map {|n| n.location}
    end

    def lead
        hired = self.auditions.find {|n| n.hired == true}
        hired ? hired : 'no actor has been hired for this role'
    end

    def understudy
        hired = self.auditions.filter {|n| n.hired == true}
        hired[1] ? hired[1] : 'no actor has been hired for understudy for this role'
    end

end