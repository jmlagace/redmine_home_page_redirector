module HomePageRedirector
  module HomePageRedirector
    def self.included(base)
      base.class_eval do
        # Redirect authenticated users to my_page after successful login
        # or home page click, if there is no back_url or referer present
        def index_with_redirector
          unless User.current.anonymous?
            redirect_back_or_default my_page_path
          else
            index_without_redirector
          end
        end
        alias_method_chain :index, :redirector 
      end
    end
  end
end
