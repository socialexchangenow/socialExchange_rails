class MotionaiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def globalhook
    puts "motion.ai: globalhook: params=#{params.inspect}"

    handled = false

    case params[ "moduleNickname" ]
    when "Start"
      handled = handleStart( params )
    when "Select Charity"
      handled = handleSelectCharity( params )
    end

    render json: {} unless handled
  end

  private

    def handleStart( p )
      if p[ "direction" ] == "in"
        render json: { userStatus: "firsttimer" }
        return true
      end

      false
    end

    def handleSelectCharity( p )
      if p[ "direction" ] == "in"
        charities = Charities.all.to_a
	numCards = charities.length / 3 + 1
	cards = []
	(0..numCards-1).each do |i|
	  cStart = i*3
	  cEnd = [cStart + 3, charities.length-1 ].min
	  card = {
            cardTitle: "Select a charity",
            cardSubtitle: null,
            cardImage: null,
            cardLink: null,
            buttons: 
	      (cStart..cEnd).each do |j|
                buttonText: charities[j].name,
                buttonType: "module",
                webviewHeight: null,
                target:  'Select Charity Offers',
	      end
	  }
	  cards << card
	end

        render json: { "cards": cards }
	return true
      end

      false
    end

end
