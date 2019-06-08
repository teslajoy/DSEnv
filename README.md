Not the smallest Docker image, but it's one that would help you knitt an rmarkdown in a bash shell or fire up ipython for your workflow tuning with the latest python3 and R versions. Data Science (DS) tools/libs enviornment to work with. 
 
> setup 

- R or Python3 libraries you need for your project's application. 
- add services and change the service name as you need in `docker-compose.yml` file 
- change the path to your data input and output in `docker-compose.yml` file 
- add the path to your local application in DockerFile 
- change the commands and entrypoints as you need in Dockerfile 

> execute

1. `docker-compose build <my service name>` (may need sudo to fireup docker daemon)
2. `docker-compose run --rm <my service name>`
3.  :tada: may the force be with you! 
