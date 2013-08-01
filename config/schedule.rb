every 2.minutes do
  command "cd '#{path}'"
  command "rake search:index"
end