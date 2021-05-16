#!/bin/bash

go tool pprof -png -output pprof_profile.png http://localhost:6060/debug/pprof/profile?seconds=$0 &
go tool pprof -png -output pprof_heap.png http://localhost:6060/debug/pprof/heap?seconds=$0 &
go tool pprof -png -output pprof_block.png http://localhost:6060/debug/pprof/block?seconds=$0 &
go tool pprof -png -output pprof_mutex.png http://localhost:6060/debug/pprof/mutex?seconds=$0 &
wait 
curl -X POST -F img=@pprof_profile.png img=@pprof_heap.png img=@pprof_block.png img=@pprof_mutex.png $1 