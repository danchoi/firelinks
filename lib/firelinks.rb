
puts "Starting firelinks"
puts "Press CTRL-C to stop"
sleep 1

if `which elinks` !~ /\w/
  abort "Missing elinks! Please install it."
end

`killall elinks`

paths = ["#{ENV['HOME']}/.mozilla/firefox", "#{ENV['HOME']}/Library/Application Support"]
history_path = `find #{paths.map {|p| "'#{p}'"}.join(' ')} -mmin -20 -name places.sqlite`.split("\n")[0].chomp
  
puts "Using Firefox database: #{history_path.inspect}"

if history_path == ''
  abort "You're missing your Firefox browser history database. Are you sure you have a recent version of Firefox installed?"
end

command = %Q{sqlite3 -line '#{history_path}' 'select url, title, last_visit_date from moz_places order by last_visit_date desc limit 2'}

use_remote = nil

url = nil

trap("INT") {
  puts "Goodbye"
  exit
}

loop do 
  res = %x{ #{command} }
  current_url = res[/^\s+url = (.*)/, 1]
  if current_url != url
    url = current_url
    cmd = if use_remote 
            %Q|elinks -remote 'openURL("#{url}")'|
          else
            "elinks '#{url}'"
          end
    use_remote ||= true

    spawn(cmd)
  end
  sleep 0.5
end
