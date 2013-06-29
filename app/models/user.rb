class User < ActiveRecord::Base

  def self.fetch_china_users
    @users = 10.times.collect { |page| search_users("location:china", page + 1).body.users }
    save_users
  end

  private

  class << self
    def search_users keyword=nil, start_page=1, sort='followers', order='desc'
      keyword ||= "followers:>0"
      search = Github::Search.new ssl: { login: 'cbtester', password: 'cbtester123*', verify: false }
      search.users "#{keyword}?start_page=#{start_page}&sort=#{sort}&order=#{order}"
    end

    def save_users
      @users.each do |user|
        binding.pry
        params = {
          uid:         user.id,
          gravatar_id: user.gravatar_id,
          fullname:    user.fullname,
          location:    user.location,
          language:    user.language,
          followers:   user.followers
        }
        exist_user = check_user user.id
        exist_user.update_attributes! params
      end
    end

    def check_user uid
      user = User.find_by_uid uid
      user = User.new unless user
      return user
    end
  end
end