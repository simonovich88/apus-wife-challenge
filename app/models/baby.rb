class Baby < ApplicationRecord
    has_many :breastfeedings, dependent: :destroy
    def total_quantity
        breastfeedings.sum(:quantity)
    end

    def breastfeedings_times_today
        breastfeedings.where('created_at > ?', Date.today).count
    end

    def last_breastfeeding_today_date
        breastfeedings.where('created_at > ?', Date.today).last&.created_at
    end

    def last_breastfeeding_quantity_today
        breastfeedings.where('created_at > ?', Date.today).sum(:quantity)
    end

    def last_breastfeeding_time_today
        breastfeedings.where('created_at > ?', Date.today).sum(:feeding_time)      
    end

end
