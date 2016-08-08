Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))
ActiveJob::Base.logger = Logger.new((File.join(Rails.root, 'log', 'active_job.log')))