class MotionaiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def globalhook
    puts "motion.ai: GlobalHook: params=#{params.inspect}"
    head :ok
  end

end
