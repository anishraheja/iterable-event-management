class Event < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations

  after_create :send_email_notification_to_user, if: -> { self.event_b? }

  enum event_type: {
    event_a: 0,
    event_b: 1
  }

  private

  def send_email_notification_to_user
    puts 'Notification Sent'
  end
end
