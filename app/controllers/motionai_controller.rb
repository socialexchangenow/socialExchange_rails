class MotionaiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def globalhook
    puts "motion.ai: globalhook: params=#{params.inspect}"
    render json: {} and return

    response = nil

    case params[ "moduleID" ]
    when "425524"
      response = handleWelcome( params )
    when "428509"
      response = handleSelectCharity( params )
    end

    response = {} if response.nil?

    puts "motion.ai: globalhook: response=#{response}"

    render json: response
  end

  def bootstraphook
    puts "motion.ai: bootstraphook: params=#{params.inspect}"
    render json: { userStatus: "firsttimer" }
  end

  private

    def handleWelcome( p )
      # if p[ "direction" ] == "in"
        return { userStatus: "firsttimer" }
      # end
      #nil
    end

    def handleSelectCharity( p )
      strReply = CGI.unescape( p[ "reply" ] )
      strDirection = p[ "direction" ]

      if p[ "direction" ] == "out" && strReply == "Awesome!"
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
                  buttonText: "#{charities[j].name}",
                  buttonType: "module",
                  webviewHeight: nil,
                  target: "Code: #{charities[j].shortCode}",
                }
              end
          }
          cards << card
        end

        return { status: "hook response", "cards": cards }

      elsif p[ "direction" ] == "in" && strReply[0..4] == "Code:"
        charityCode = strReply[6..-1]
	charity = Charity.where( shortCode: charityCode ).first
	unless charity.nil?
	  return {
	    currentCharityName: charity.name,
	    currentCharityCode: charity.shortCode,
	    status: "code match"
	  }
	end

      else p[ "direction" ] == "in"
        charityName = strReply.downcase
	charity = Charity.where( "name ILIKE '%#{charityName}%'" ).first
	unless charity.nil?
	  return {
	    currentCharityName: charity.name,
	    currentCharityCode: charity.shortCode,
	    status: "soft match"
	  }
	end
      end

      nil
    end

    def handleSelectCharityOffer( p )
      strReply = CGI.unescape( p[ "reply" ] )
      strDirection = p[ "direction" ]

      if p[ "direction" ] == "out"
	charity = Charity.where( name: charityName ).first
        offers = CharityOffer.all.to_a
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
                  buttonText: "#{charities[j].name}",
                  buttonType: "module",
                  webviewHeight: nil,
                  target: "Code: #{charities[j].shortCode}",
                }
              end
          }
          cards << card
        end

        return { status: "hook response", "cards": cards }

      elsif p[ "direction" ] == "in" && strReply[0..4] == "Code:"
        charityCode = strReply[6..-1]
	charity = Charity.where( shortCode: charityCode ).first
	unless charity.nil?
	  return {
	    currentCharityName: charity.name,
	    currentCharityCode: charity.shortCode,
	    status: "code match"
	  }
	end

      else p[ "direction" ] == "in"
        charityName = strReply.downcase
	charity = Charity.where( "name ILIKE '%#{charityName}%'" ).first
	unless charity.nil?
	  return {
	    currentCharityName: charity.name,
	    currentCharityCode: charity.shortCode,
	    status: "soft match"
	  }
	end
      end

      nil
    end

end
