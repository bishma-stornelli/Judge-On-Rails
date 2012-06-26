module ApplicationHelper
  def render_flash flash
    answer = ""
    flash.each do |key, value|
      answer += %Q{<div class='alert-#{key}'>#{value}</div>}
    end
    answer = %{<script>$(".alert").hide().html("#{answer}").slideDown(300).delay(3000).slideUp(300);</script>}
    answer
  end
end
