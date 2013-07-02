require 'open-uri'

class User 
  include Mongoid::Document
  field :uid
  field :gravatar_id
  field :fullname
  field :location
  field :language
  field :username
  field :followers,         type: Integer
  field :contrib_total,     type: Integer
  field :current_streak,    type: Integer
  field :contrib_startDate, type: DateTime
  field :contrib_endDate,   type: DateTime

  def self.fetch_china_users
    @users = 1.times.collect { |page| search_users("location:china", page + 1).body.users }.flatten
    save_users
  end

  private

  class << self
    def search_users keyword=nil, start_page=1, sort='followers', order='desc'
      keyword ||= "followers:>0"
      search = Github::Search.new login: 'cbtester', password: 'cbtester123*', ssl: { verify: false }
      search.users "#{keyword}?start_page=#{start_page}&sort=#{sort}&order=#{order}"
    end
    
    def save_users
      @users.each do |user|
        contribs = get_user_contrib user.username
        
        params = {
          uid:               user.id,
          gravatar_id:       user.gravatar_id,
          fullname:          user.fullname,
          location:          user.location,
          language:          user.language,
          followers:         user.followers,
          username:          user.username,
          contrib_total:     contribs[:contrib_total_count],
          current_streak:    contribs[:current_streak_days],
          contrib_startDate: contribs[:contrib_startDate],
          contrib_endDate:   contribs[:contrib_endDate]
        }
        user = User.find_or_initialize_by uid: user.id
        user.update_attributes params
      end
    end

    def get_user_contrib username
      xml_doc = Nokogiri::XML open("https://github.com/#{ username }")
      # get total contributions
      contribs_data = xml_doc.xpath('//div[@class = "col contrib-day"]').text.split(/\n/)
      contrib_total_count = contribs_data[1].gsub(/\D/, "")
      contrib_startDate = contribs_data[2].split('-')[0].strip
      contrib_endDate = contribs_data[2].split('-')[1].strip
      
      # get current streak
      streak_data =  xml_doc.xpath('//div[@class = "col contrib-streak-current"]').text.split(/\n/)
      streak_days = streak_data[1].gsub(/\D/, "") # how many days of current streak
      {contrib_total_count: contrib_total_count, contrib_startDate: contrib_startDate, 
        contrib_endDate: contrib_endDate, current_streak_days: streak_days}
    end  
  end
end
