class MotionaiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def globalhook
    puts "motion.ai: globalhook: params=#{params.inspect}"
    render json: {}
  end

  def starthook
    puts "motion.ai: starthook: params=#{params.inspect}"
    render json: {}
  end

end
