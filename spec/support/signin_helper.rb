# frozen_string_literal: true

module SigninHelper
  def sign_in_as(user)
    discord_info = {
      guild: {
        id: ENV['DISCORD_GUILD_ID'],       
        name: "guild_name", 
        owner: false
      }, 
      me: {
        id: user.discord_id, 
        username: user.name, 
        discriminator: user.discriminator, 
        avatar: user.avatar
      }
    }

    allow(Discord).to receive(:connect).and_return(discord_info)

    yield
    
    allow(Discord).to receive(:connect).and_return(nil)
  end
end
