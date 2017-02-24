class MotionaiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def globalhook
    puts "motion.ai: globalhook: params=#{params.inspect}"

    render json: {} and return if params[ "moduleNickname" ] != "Start" || 
      params[ "direction" ] != "in" 

    render json: { userStatus: "member" }
  end

  def bootstraphook
    puts "motion.ai: bootstraphook: params=#{params.inspect}"

    render json: { userStatus: "firsttimer" }
  end

end
