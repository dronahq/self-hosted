cd ~/dronahq/self-hosted
sudo docker-compose pull
sudo docker-compose down
sudo docker-compose up -d
sudo docker-compose logs -f