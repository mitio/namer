module ApplicationHelper
  def top_navigation_urls
    {
      I18n.t('nav.home')                    => root_path,
      I18n.t('nav.new_project')             => new_project_path,
      I18n.t('nav.projects')                => projects_path,
      I18n.t('nav.suggestions')             => suggestions_path,
      I18n.t('nav.about')                   => about_pages_path,
    }
  end

  def flash_to_alert_type(flash_type)
    case flash_type.to_sym
    when :notice then 'success'
    when :alert  then 'error'
    else              'info'
    end
  end

  def vote_types
    Vote.vote_types.map do |type|
      [t("vote_types.#{type}"), type]
    end
  end
end
