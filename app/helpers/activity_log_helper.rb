class Stuff
  class << self
    include HTMLDiff
  end
end

module ActivityLogHelper
  def display_changed_fields(changes)
    return if changes.blank?
    field_list = []
    changes.each do |key, value|
      field_list << content_tag(:dt, key.titleize)
      before_after = "#{content_tag :div, value_or_empty(value.first), class: 'prior_value'}#{content_tag :div, value_or_empty(value.last), class: 'present_value'}".html_safe
      diff         = "#{content_tag :div, Stuff.diff(value_or_zls(value.first), value_or_zls(value.last)).html_safe, class: 'values_diff'}".html_safe
      field_list << content_tag(:dd, before_after + diff)
    end
    content_tag(:dl, field_list.join("").html_safe)
  end

  def value_or_empty(value)
    value.blank? ? t(".empty_change_value") : value
  end

  def value_or_zls(value)
    value.blank? ? '' : value.to_s
  end
end
