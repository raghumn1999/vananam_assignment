This is nodejs web app.
The nodejs app is Containerized,we can build and run application using Dockerfile

# Step to Build dockerfile

``` 
docker build -f Dockerfile -t nodejsapp:<git_tag> .
Ex: docker build -f Dockerfile -t nodejsapp:v0.0.1 .
```

# Step to run nodejs application
```
docker run -d -p 8080:3000 nodejsapp:<git_tag>
Ex: docker run -d -p 8080:3000 nodejsapp:v0.0.1
```

To avoid using root user,i have used node user and changing permission to have files and folder with node user.

# Web-hooks details:
I have used ngrok to create publicly accessable url and configure in webhook.
Once we commit changes to main branch,web-hooks is configured and CI job triggered automatically.
If CI job got success,CI job will trigger CD job to update container.

# CI job details
* This CI job will have following stages
  * clone the repo.
  * install node dependencies.
  * npm lint will scans all project files,checks them against predefined linting rules,Reports warnings or errors.
  * npm test runs the test scripts defined in project’s package.json.
  * build docker image and push image to my registry.
  * get the previous image tag if deployment failed while updating.
  * if CI got success,CI will trigger CD job with details parameter
  * if CI got failes,CI will not trigger CD.
  * Irrespective of success or failure,deleting image and workspace to free up space on server.

# CD job details:
* This CD job will have following stages
  * Pull the image from my registry
  * Update container with new tag
  * if CD job fail,it roll back container to previous tag.

I have placed output of web-hooks configuration,CI and CD output,images pushed to my registry

