module SlackGamebot
  module Commands
    class Sucks < SlackRubyBot::Commands::Base
      command 'sucks', 'suck', 'you suck', 'sucks!', 'you suck!' do |client, data, _match|
        user = ::User.find_create_or_update_by_slack_id!(client, data.user)
        if user.losses && user.losses > 5
          client.say(channel: data.channel, text: "No <@#{data.user}>, with #{user.losses} losses, you rock!", gif: 'loser')
        elsif user.rank && user.rank > 3
          client.say(channel: data.channel, text: "No <@#{data.user}>, with a rank of #{user.rank}, you rock!", gif: 'loser')
        else
          client.say(channel: data.channel, text: "No <@#{data.user}>, you rock!", gif: 'rude')
        end
        logger.info "SUCKS: #{client.owner} - #{data.user}"
      end
    end
  end
end
