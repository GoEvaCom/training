## TUTORIAL EOS
```
docker-compose build
docker-compose up
```

Then you need to build and deploy abi
```
docker exec -it eos_tutorial_keosd_1 ./contracts-entrypoint.sh
```

## Open bash inside docker 
```
docker exec -ti eos_tutorial_nodeosd_1 /bin/sh

```

## Alias cleos to run it
```
alias cleos3='docker exec  eos_tutorial_nodeosd_1  cleos -u http://nodeosd:8888'
```
