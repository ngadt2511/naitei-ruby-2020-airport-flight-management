module ApplicationHelper
  def full_title page_title = ""
    base_title = t ".name"
    page_title.empty? ? base_title : [page_title, base_title].join(" | ")
  end

  def modify_label_color status
    case status
    when :pending
      :secondary
    when :approved
      :success
    when :rejected
      :danger
    when :canceled
      :dark
    else
      :warning
    end
  end
end
