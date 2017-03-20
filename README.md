# sraleik_cv

## Launch in dev

```bash
cd ~/Documents/code
git clone https://gitlab.com/Sraleik/sraleik_cv.git
cd sraleik_cv
docker run -d -p 3000:3000 -v (pwd):/app -e GIT_COMMIT=dev --name sraleik_cv_web registry.gitlab.com/sraleik/php_blank:latest
```

## Launch in production

```bash
cd ~/Documents/code
git clone https://gitlab.com/Sraleik/sraleik_cv.git
cd sraleik_cv
docker run -d -p 80:80 -v (pwd):/app -e GIT_COMMIT=production --name sraleik_cv_web registry.gitlab.com/sraleik/php_blank:latest
```

- GIT_COMMIT=production, the container will checkout to production (or any other branch except dev) and pull


## Mise en production

```bash
cd ~/Documents/code/sraleik_cv
docker rm -f sraleik_cv_web
docker run -d -p 80:80 -v (pwd):/app -e GIT_COMMIT=production --name sraleik_cv_web registry.gitlab.com/sraleik/php_blank:latest
```

No git pull necessary. The container will take care of that

## Docker logs, to watch what's going on inside the container

```bash
docker logs -f sraleik_cv_web
```

## Get inside the container

```bash
docker exec -it sraleik_cv_web /bin/bash
```

## Get last version of docker image

```bash
docker pull registry.gitlab.com/sraleik/php_blank:latest
```
