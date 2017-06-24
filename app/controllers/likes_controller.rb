class LikesController < ApplicationController
skip_before_action :verify_authenticity_token
before_action :find_likeable
before_action :authenticate_user!

  def create
   @likeable.liked_by current_user
 end

 private

 def find_likeable
   @likeable_type = params[:likeable_type].classify
   @likeable = @likeable_type.constantize.find(params[:likeable_id])
 end

end