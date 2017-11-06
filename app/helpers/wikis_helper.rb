module WikisHelper
    require 'pundit'
    def user_is_authorized_for_edit?(wiki)
        current_user
    end
    
    def is_an_admin?
        true if current_user && current_user.admin?
    end
    
    def user_is_authorized_for_delete?(wiki)
        current_user == wiki.user || is_an_admin?
    end
    
    def is_premium?
        true if current_user && current_user.premium?
    end
end
