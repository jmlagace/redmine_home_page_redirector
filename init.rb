Redmine::Plugin.register :redmine_home_page_redirector do
  name 'Home Page Redirector'
  author 'Jean-Marc Lagacé'
  description 'When a user is signed-in. The Home link sends to My Page.'
  version '1.0.0'
  url 'https://github.com/jmlagace/redmine_home_page_redirector'
  author_url 'http://m2i3.com'

  
end

if Rails.version > '6.0'
  if Rails.configuration.respond_to?(:autoloader) && Rails.configuration.autoloader == :zeitwerk
    Rails.autoloaders.each { |loader| loader.ignore(File.dirname(__FILE__) + '/lib') }
  end
  require File.dirname(__FILE__) + '/lib/home_page_redirector'

  WelcomeController.send(:include, HomePageRedirector::HomePageRedirector)
else
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