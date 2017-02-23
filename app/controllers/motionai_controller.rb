class MotionaiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def globalhook
    puts "motion.ai: globalhook: params=#{params.inspect}"
    render json: {}
  end

  def bootstraphook
    puts "motion.ai: bootstraphook: params=#{params.inspect}"
    render json: { hack: "done", userstatus: "member" }
  end

  def starthook
    puts "motion.ai: starthook: params=#{params.inspect}"
    render json: {}
  end

end
