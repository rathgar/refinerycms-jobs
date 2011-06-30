::User.find(:all).each do |user|
  if user.plugins.where(:name => 'refinerycms_jobs').blank?
    user.plugins.create(:name => "refinerycms_jobs",
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end if defined?(::User)


if defined?(::Page)
  page = ::Page.create(
    :title => "Jobs",
    :link_url => "/jobs",
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => "^/jobs?(\/|\/.+?|)$"
  )

  ::Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end


