module WikisHelper
    def user_is_authorized_for_edit?(wiki)
        current_user
    end
    
    def user_is_authorized_for_delete?(wiki)
        current_user == wiki.user || current_user.admin?
    end
end
