module JobsHelper
    require 'pundit'
    def user_is_authorized_for_edit?(job)
        current_user == job.user || is_an_admin?
    end
    
    def is_an_admin?
        true if current_user && current_user.admin?
    end
    
    def user_is_authorized_for_delete?(job)
        current_user == job.user || is_an_admin?
    end
    
end
