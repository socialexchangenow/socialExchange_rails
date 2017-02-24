class MotionaiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def globalhook
    puts "motion.ai: globalhook: params=#{params.inspect}"

    # boostrap the start method
    render json: { userStatus: "firsttimer" } and
      return if params[ "moduleNickname" ] == "Start" && 
        params[ "direction" ] == "in" 

    # default: doo nothing
    render json: {}
  end

end
