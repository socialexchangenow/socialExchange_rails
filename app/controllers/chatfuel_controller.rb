class ChatfuelController < ApplicationController
  skip_before_action :verify_authenticity_token

  def pushindividualhook
    puts "chatfuel: pushindividualhook: params=#{params.inspect}"

    response = {}

    begin
      i = Individual.where( source: params[ "source" ], sourceID: params[ "sourceID" ] ).first
      if i.nil?
        i = Individual.create( {
          source: params[ "source" ],
          sourceID: params[ "sourceID" ],
          firstName: params[ "fb_first_name" ],
          lastName: params[ "fb_last_name" ],
        } )
      else
        i.firstName = params[ "fb_first_name" ]
        i.lastName = params[ "fb_last_name" ]
        i.save
      end
    rescue Exception => e
      puts "Exception: e=#{e.message}"
      puts e.backtrace.join( "\n")
    end
 
    puts "chatfuel: pushindividualhook: response=#{response.inspect}"
    render json: response
  end

  def getindividualhook
    puts "chatfuel: getindividualhook: params=#{params.inspect}"

    response = {
      "set_attributes": {
        "user_status": "firsttimer"
      },
      #"messages": [
      #  { "text": "Hello {{fb_first_name}}" }
      #]
    }

    begin
      i = Individual.where( source: params[ "source" ], sourceID: params[ "sourceID" ] ).first
      response[ :set_attributes ][ :user_status ] = "member" unless i.nil?
    rescue Exception => e
      puts "Exception: e=#{e.message}"
      puts e.backtrace.join( "\n")
    end

    puts "chatfuel: getindividualhook: response=#{response.inspect}"
    render json: response
  end

  def getcharitieshook
    puts "chatfuel: getcharitieshook: params=#{params.inspect}"

    response = {
      messages: [
        {
          attachment: {
            type: "template",
            payload: {
              template_type: "generic",
              elements: []
            }
          }
        }
      ]
    }

    begin
      charities = Charity.all.to_a
      numCards = charities.length / 3 + 1
      cards = []
      elements = response[ :messages ][0][ :attachment ][ :payload ][ :elements ]
      (0..numCards-1).each do |i|
        cStart = i*3
        cEnd = [cStart + 2, charities.length-1 ].min
        element = {
          title: "Select a charity",
          subtitle: nil,
          image_url: nil,
          buttons: 
            (cStart..cEnd).map do |j|
              {
                type: "show_block",
                title: "#{charities[j].name}",
                block_name: "Select a charity offer",
                set_attributes: {
                  current_charity: "#{charities[j].id}",
                }
              }
            end
        }
        elements << element
      end
    rescue Exception => e
      response = {}
      puts "Exception: e=#{e.message}"
      puts e.backtrace.join( "\n")
    end

    puts "chatfuel: getcharitieshook: response=#{response.inspect}"
    render json: response
  end

  def getcharityoffershook
    puts "chatfuel: getcharityoffershook: params=#{params.inspect}"

    maxCards = 9 # for face book
    charity_id = params[ "charity_id" ]
    response = {
      messages: [
        {
          attachment: {
            type: "template",
            payload: {
              template_type: "generic",
              elements: []
            }
          }
        }
      ]
    }

    begin
      offers = CharityOffer.where( charity_id: charity_id ).to_a
      cards = []
      elements = response[ :messages ][0][ :attachment ][ :payload ][ :elements ]
      (0..[offers.length-1, maxCards-1].min).each do |i|
        element = {
          title: "#{offers[i].shortDescription}",
          subtitle: "#{offers[i].longDescription}",
          image_url: nil,
          buttons: [
            {
              type: "show_block",
              title: "Select",
              block_name: "Pick charity offer",
              set_attributes: {
                current_charity_offer: "#{offers[i].id}",
              }
            },
            {
              type: "show_block",
              title: "Remove",
              block_name: "Unpick charity offer",
              set_attributes: {
                current_charity_offer: "#{offers[i].id}",
              }
            },
          ]
        }
        elements << element
      end
    rescue Exception => e
      response = {}
      puts "Exception: e=#{e.message}"
      puts e.backtrace.join( "\n")
    end

    puts "chatfuel: getcharityoffershook: response=#{response.inspect}"
    render json: response
  end

  private

end
