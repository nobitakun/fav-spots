class StaticPagesController < ApplicationController
  layout "application_one_column"
  def home
    @reviews = Review.limit(4).order('created_at DESC')
    @infos = Info.limit(4).order('created_at DESC')
    @prefs = JpPrefecture::Prefecture.all
    @wp_path = ENV['WP_PATH']
    
    conn = Faraday.new(url: @wp_path) do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
    
    conn_experience = Faraday.new(url: @wp_path) do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end

    response = conn.get '/wp-json/wp/v2/columns?_embed'
    
    @parsed_columns = JSON.parse(response.body)
  
    response = conn_experience.get '/wp-json/wp/v2/experiences?_embed' 
    
    @parsed_experiences = JSON.parse(response.body)
  end

  def dbmap
  end
end
