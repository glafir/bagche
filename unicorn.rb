deploy_to = "/home/glafir/RoR/bagche/"
rails_root = "#{deploy_to}"
socket_file = "#{deploy_to}tmp/sockets/unicorn.sock"
pid_file = "#{deploy_to}tmp/pids/unicorn.pid"
old_pid = pid_file + '.oldbin'
log_file = "#{deploy_to}log/unicorn.stderr.log"
err_log = "#{deploy_to}/log/unicorn.stdout.log"

#rails_env = ENV['RAILS_ENV'] || 'production'
#worker_processes (rails_env == 'production' ? 3 : 1)
worker_processes 1
preload_app true
timeout 36000
listen socket_file, :backlog => 1024
pid pid_file
stderr_path err_log
stdout_path log_file

GC.copy_on_write_friendly = true if GC.respond_to?(:copy_on_write_friendly=)

before_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.connection.disconnect!
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.establish_connection
end

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{rails_root}/Gemfile"
end
