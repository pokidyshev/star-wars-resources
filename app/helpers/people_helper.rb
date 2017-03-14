module PeopleHelper
  def page_class(i, active)
    c = 'people-page'
    c += ' active' if i == active.to_i
    c
  end

  def page_sizes
    Person::PER_PAGE
  end
end
