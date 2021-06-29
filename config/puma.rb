# frozen_string_literal: true

workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['SINATRA_MAX_THREADS'] || 5)
threads threads_count, threads_count
root = "#{Dir.getwd}"

rackup      DefaultRackup
port        ENV['PORT']     || 9292
environment ENV['RACK_ENV'] || 'development'
activate_control_app "tcp://127.0.0.1:9293"
bind "unix://#{root}/tmp/puma.sock"
pidfile "#{root}/tmp/pids/puma.pid"
state_path "#{root}/tmp/pids/puma.state"