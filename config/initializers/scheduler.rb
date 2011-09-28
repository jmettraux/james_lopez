
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.in('10s') do
  msg = Time.now.to_s + ' scheduler ' + '*' * 40
  Rails.logger.info(msg)
  File.open(Rails.root.join('tmp/scheduler.txt'), 'wb') { |f| f.puts(msg) }
end

Thread.new do
  sleep 10
  msg = Time.now.to_s + ' thread    ' + '*' * 40
  Rails.logger.info(msg)
  File.open(Rails.root.join('tmp/thread.txt'), 'wb') { |f| f.puts(msg) }
end

