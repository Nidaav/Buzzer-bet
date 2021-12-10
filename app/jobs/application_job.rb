class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked
  queue_as :default
  def refresh_info
    puts "I'm starting the fake job"
    sleep 3
    puts "OK I'm done now"
  end
end
  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
