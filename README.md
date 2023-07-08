# webhook-docker

A docker container setup for adnanh/webhook

## using

In one line, assuming you have `hooks.yml` in a local directory:

```text
docker run --rm --name webhook -p9000:9000 -v $(pwd):/etc/webhook leonjza/webhook
```
