# Example docker development environment for RubyOnRails

## Used images:
###   web
Rails app.

###   db
    image: postgres:12.3-alpine

###   redis
    image: redis:6.0.6-alpine3.12

###   elasticsearch
    image: docker.elastic.co/elasticsearch/elasticsearch:7.9.0
####    Possible problems:
https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_set_vm_max_map_count_to_at_least_262144
Solutions:
    Manjaro:

    $ sysctl -w vm.max_map_count=2621d44
