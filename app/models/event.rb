class Event < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations

  after_create :send_email_notification_to_user, if: :event_b?

  enum type: {
    event_a: 0,
    event_b: 1
  }

  private

  def send_email_notification_to_user
    # notify user about the event creation
  end

  def event_b?
    self.event_b?
  end
end
