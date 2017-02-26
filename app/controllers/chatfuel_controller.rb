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
    end
 
    puts "chatfuel: pushindividualhook: response=#{response.inspect}"
    render json: response
  end

  def getindividualhook
    puts "chatfuel: getindividualhook: params=#{params.inspect}"

    begin
      i = Individual.where( source: params[ "source" ], sourceID: params[ "sourceID" ] )
      response = {
        "set_attributes": {
          "user_status": "firsttimer"
        },
        "messages": [
          { "text": "Hello {{fb_first_name}}" }
        ]
      }

      response[ "set_attributes" ][ "user_status" ] = "member" unless i.nil?
    rescue Exception => e
      puts "Exception: e=#{e.message}"
    end

    puts "chatfuel: getindividualhook: response=#{response.inspect}"
    render json: response
  end

  private

end
