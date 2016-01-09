web: bundle exec puma -C config/puma.rb
worker: QUEUE=* bundle exec rake resque:work
scheduler: bundle exec rake resque:scheduler
