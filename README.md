![](http://bitflu.workaround.ch/bitflu.png)
## Now with more Docker
Uses the latest Perl image.

### Example
``` Beef
docker run -it \
  --name bitflu \
  --restart unless-stopped \
  -p 4081:4081 \
  -p 6881:6881/tcp -p 6881:6881/udp \
  -p 6688:6688/tcp -p 6688:6688/udp \
  -v bitflu-workdir:/bitflu/workdir \
  themetabay/bitflu
```
