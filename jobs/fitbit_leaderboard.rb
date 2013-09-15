fitbit = Fitbit.new

SCHEDULER.every "15m", first_in: 0 do |job|
  if fitbit.errors?
    send_event "fitbit-leaderboard", { error: fitbit.error }
  else
    send_event "fitbit-leaderboard", { people: fitbit.leaderboard }
  end
end
