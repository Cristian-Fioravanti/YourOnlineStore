docker-compose -f docker-push.yml build yourstore-frontend-base
docker-compose -f docker-push.yml push yourstore-frontend-base
docker-compose -f docker-push.yml build
docker-compose -f docker-push.yml push
