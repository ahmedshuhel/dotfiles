# Docker

## Run #Dynalite

```bash
docker run --rm --init -p 4569:8000 -v /tmp/dynamodb:/data dimaqq/dynalite:latest --path data
```

## Run Kinesalite

```bash
docker run --rm  --name mykinesis -p 4570:4567 instructure/kinesalite
```
