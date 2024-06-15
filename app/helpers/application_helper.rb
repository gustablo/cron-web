module ApplicationHelper
  def show_svg(path)
    File.open("app/assets/images/#{path}", 'rb') do |file|
      raw file.read
    end
  end

  def last_run_in_words(date)
    "Last run at #{date.to_datetime.strftime('%B %e, %Y %H:%M')}"
  end

  def next_run_in_words(date)
    now = DateTime.now.strftime('%a, %d %b %Y %H:%M:%S').to_datetime
    future_date = date.to_datetime
    return 'Should not run again' if future_date < now

    "Next run in #{distance_of_time_in_words(now, future_date)}"
  end

  def cron_expression_in_words(expression)
    Cronex::ExpressionDescriptor.new(expression).description
  end
end
