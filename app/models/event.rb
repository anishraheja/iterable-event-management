class Event < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations

  after_create :create_iterable_in_app_click_event, if: -> { self.event_a? }
  after_create :create_iterable_in_app_open_event, if: -> { self.event_b? }
  after_create :send_email_notification_to_user, if: -> { self.event_b? }

  validates :name, :event_code, :event_type, presence: true

  enum event_type: {
    event_a: 0,
    event_b: 1
  }

  private

  def send_email_notification_to_user
    SendEmailNotification.call(self)
    puts 'Notification Sent'
  end

  def create_iterable_in_app_click_event
    InAppClickEvent.call(self)
  end

  def create_iterable_in_app_open_event
    InAppOpenEvent.call(self)
  end
end
