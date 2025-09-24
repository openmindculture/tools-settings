# Docker Armageddon: purge everything
# by David González Ruiz and Marcos Aguayo
# https://stackoverflow.com/questions/34658836/docker-is-in-volume-in-use-but-there-arent-any-docker-containers

# removecontainers
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

# purge everything else
docker network prune -f
docker rmi -f $(docker images --filter dangling=true -qa)
docker volume rm $(docker volume ls --filter dangling=true -q)
docker rmi -f $(docker images -qa)

# Even after removing all containers and images, running docker-compose up will simply reattach the existing volume, which still contains the previous MySQL database with WordPress settings, users, and URLs.
# How to Truly Wipe All Data
# The only way to guarantee ALL persistent data (including your MariaDB/WordPress database) is removed is by also deleting Docker volumes:
# With Compose: docker-compose down -v
# With Docker CLI: docker volume rm <volumename> for each relevant volume