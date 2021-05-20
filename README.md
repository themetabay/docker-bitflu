![](http://bitflu.workaround.ch/bitflu.png)
## This is beta quality! Feel free to submit an issue if you want a new feature or find a bug :)
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
