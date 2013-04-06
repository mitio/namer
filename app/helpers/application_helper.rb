module ApplicationHelper
  def top_navigation_urls
    {
      'Home'                    => root_path,
      'New Project'             => new_project_path,
      'Your Projects'           => projects_path,
      'Your Suggestions'        => suggestions_path,
      'About'                   => about_pages_path,
    }
  end

  def flash_to_alert_type(flash_type)
    case flash_type.to_sym
    when :notice then 'success'
    when :alert  then 'error'
    else              'info'
    end
  end
end
