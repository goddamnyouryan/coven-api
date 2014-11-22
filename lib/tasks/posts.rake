namespace :posts do
  desc 'Get any new posts for the sources'
  task sync: :environment do
    Post.delay.sync
  end
end
