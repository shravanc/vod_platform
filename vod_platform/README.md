# README

docker-compose up --build
docker-compose up -d
docker-compose exec app bundle exec rake db:setup db:migrate
docker-compose exec app bundle exec rake db:seed


