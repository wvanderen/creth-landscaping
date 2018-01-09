 class JobPolicy < ApplicationPolicy

   class Scope
     attr_reader :user, :scope
 
     def initialize(user, scope)
       @user = user
       @scope = scope
     end
 
     def resolve
       jobs = []
       if @user && user.role == 'admin'
         jobs = scope.all # if the user is an admin, show them all the jobs
       else # this is the lowly standard user
         all_jobs = scope.all
         jobs = []
         all_jobs.each do |job|
           if job.user == @user
             jobs << job # only show standard users their jobs
           end
         end
       end
       jobs # return the jobs array we've built up
     end
   end
 end