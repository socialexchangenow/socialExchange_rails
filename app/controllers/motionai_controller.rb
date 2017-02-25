class MotionaiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def globalhook
    puts "motion.ai: globalhook: params=#{params.inspect}"

    handled = false

    case params[ "moduleID" ]
    when "425524"
      handled = handleWelcome( params )
    when "428509"
      handled = handleSelectCharity( params )
    end

    render json: {} unless handled
  end

  private

    def handleWelcome( p )
      if p[ "direction" ] == "in"
        render json: { userStatus: "firsttimer" }
        return true
      end

      false
    end

    def handleSelectCharity( p )
      if p[ "direction" ] == "in"
        charities = Charity.all.to_a
	numCards = charities.length / 3 + 1
	cards = []
	(0..numCards-1).each do |i|
	  cStart = i*3
	  cEnd = [cStart + 2, charities.length-1 ].min
	  card = {
            cardTitle: "Select a charity",
            cardSubtitle: nil,
            cardImage: nil,
            cardLink: nil,
            buttons: 
	      (cStart..cEnd).map do |j|
	        {
                  buttonText: "Select: #{charities[j].name}",
                  buttonType: "module",
                  webviewHeight: nil,
                  target: "Code: #{charities[j].shortCode}",
		}
	      end
	  }
	  cards << card
	end

        render json: { status: "hook response", "cards": cards }
	return true
      end

      false
    end

end
