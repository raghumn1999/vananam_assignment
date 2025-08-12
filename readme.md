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
