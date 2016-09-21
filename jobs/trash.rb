require 'json'

SCHEDULER.every '2s', :first_in => 0 do |job|
	send_event('trash', read_trash_file())
end

def read_trash_file()
    file = File.open("nextpickup.json", "r")
    data = file.read
    file.close
    data = JSON.parse(data)
    hash = { date: data["date"], type: data["type"], lastupdate: data["lastupdate"] }
    return hash
end

