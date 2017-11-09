class UsersController < ApplicationController

    def downgrade
    
        @user = current_user
        @wikis = @user.wikis
        @wikis.each do |wiki|
            wiki.private = false
            wiki.save
        end
        current_user.standard!
    end
    
    def upgrade
        current_user.premium!
    end
end
