module ApplicationHelper
  def top_navigation_urls
    {
      'Home'                    => root_path,
      'New Project'             => new_naming_project_path,
      'About'                   => 'TODO',
    }
  end
end
