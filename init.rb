Redmine::Plugin.register :home_page_redirector do
  name 'Home Page Redirector'
  author 'Jean-Marc Lagacé'
  description 'When a user is signed-in. The Home link sends to My Page.'
  version '0.0.1'
  url 'https://github.com/jmlagace/redmine_home_page_redirector'
  author_url 'http://m2i3.com'

  require_dependency 'home_page_redirector'
  
  # Here I have support for Redmine 1.x by falling back on Rails 2.x implementation.
  if Gem::Version.new("3.0") > Gem::Version.new(Rails.version) then
    Dispatcher.to_prepare do
      # This tells the Redmine version's controller to include the module from the file above.
      WelcomeController.send(:include, HomePageRedirector::HomePageRedirector)
    end
  else
    # Rails 3.0 implementation.
    Rails.configuration.to_prepare do 
      # This tells the Redmine version's controller to include the module from the file above.
      WelcomeController.send(:include, HomePageRedirector::HomePageRedirector)
    end
  end
end
