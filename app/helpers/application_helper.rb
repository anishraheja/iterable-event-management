module ApplicationHelper
  EVENT_TYPE_MAPPING = {
    'event_a' => 'Event A',
    'event_b' => 'Event B'
  }.freeze

  def event_type_display(event_type)
    EVENT_TYPE_MAPPING.fetch(event_type, 'Unknown')
  end
end
