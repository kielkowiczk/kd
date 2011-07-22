namespace :deploy do
  desc 'Push master to heroku'
  task :heroku do
    puts 'Pushing to heroku...'
    system('git push heroku master') ? true : fail
  end
  
  desc 'Push master to github'
  task  :github do
    puts 'Pushing to github...'
    system('git push github master') ? true : fail
  end
  
  desc 'Deploy to heroku and github'
  
  task :to_all => [:heroku, :github]
end