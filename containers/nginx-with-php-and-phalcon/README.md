# NGINX - with PHP and Phalcon

Although this container has nothing specific in it for UnRaid, it is for use with this that i have put it together.

## Start container locally

To start this container locally, you can use the following. If you're using this on Linux or Mac you will need to alter the `--mount` argument.

```
docker run -dit --rm -h nginx-with-phalcon --name nginx-with-phalcon --mount type=bind,source="C:\Users\me\nginx-with-phalcon",target=/var/www/html -p 8080:80 harrywebster/unraid-nginx:latest
```

## Start container in UnRaid

Login to your UnRaid control panel, navigate to `DOCKER` in the navigation and in the `Template Repositories` add `https://github.com/harrywebster/unraid-docker-templates/tree/main/templates` on a new line and hit save...

Now click on `Add container`, select dropdown `Template` and click on `NginxPhalcon` and click on `Apply`. 
