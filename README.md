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
docker run -dit -p 3001:80 --name my-apache-app registry.gitlab.com/sraleik/sraleik_cv:latest
```

- sraleik_cv:latest is build from the branch production and the Dockerfile inside this project
- this Dockerfile use an alpine base
