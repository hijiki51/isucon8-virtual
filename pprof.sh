#!/bin/bash

go tool pprof -png -output pprof_profile.png http://localhost:6060/debug/pprof/profile?seconds=$1 &
go tool pprof -png -output pprof_heap.png http://localhost:6060/debug/pprof/heap?seconds=$1 &
go tool pprof -png -output pprof_block.png http://localhost:6060/debug/pprof/block?seconds=$1 &
go tool pprof -png -output pprof_mutex.png http://localhost:6060/debug/pprof/mutex?seconds=$1 &
wait 
curl -X POST -F img=@pprof_profile.png $2 
curl -X POST -F img=@pprof_heap.png $2 
curl -X POST -F img=@pprof_block.png $2 
curl -X POST -F img=@pprof_mutex.png $2 