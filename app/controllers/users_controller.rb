class UsersController < ApplicationController
    def downgrade
        current_user.standard!
    end
end
