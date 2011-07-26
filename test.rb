

history_path = "#{ENV['HOME']}/.config/google-chrome/Default/History"

command = %Q{ cp #{history_path} temp.db && sqlite3 -line temp.db 'select title, url, last_visit_time from urls where title != "" order by last_visit_time desc limit 3' | less }

mtime = Time.now - 100000


use_remote = nil

loop do 
  current_mtime = File.mtime history_path
  if current_mtime > mtime
    mtime = current_mtime
    
    res = %x{ #{command} }
    url = res[/^\s+url = (.*)/, 1]

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
