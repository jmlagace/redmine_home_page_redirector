module HomePageRedirector
  module HomePageRedirector
    def self.included(base)
      base.class_eval do
        # Insert overrides here, for example:
        def index_with_redirector
          unless User.current.anonymous?
            redirect_to my_page_path
          else
            index_without_redirector
          end
        end
        alias_method :index_without_redirector, :index
        alias_method :index, :index_with_redirector
      end
    end
  end
end
