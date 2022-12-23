# heart
Home dashboard framework

Deploy

If entrypoint.sh or Dockerfile has changed the new container needs to be pushed:
heroku container:push web

Then deploy by releasing, which will mostly just restart and so cause entrypoint.sh to run:
heroku container:release web