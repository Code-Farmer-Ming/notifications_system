ActiveJob::Base.logger = Logger.new((File.join(Rails.root, 'log', 'active_job.log')))