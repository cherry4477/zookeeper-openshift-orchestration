#!/bin/bash

echo ${MYID:-1} > /zookeeper/data/myid

if [ -n "$SERVERS" ]; then
	IFS=\, read -a servers <<<"$SERVERS"
	for i in "${!servers[@]}"; do 
		printf "\nserver.%i=%s:2888:3888" "$((1 + $i))" "${servers[$i]}" >> /zookeeper/conf/zoo.cfg
	done
fi

echo "zookeeper.DigestAuthenticationProvider.superDigest=${ZOO_PASSWORD}" >> /zookeeper/conf/zoo.cfg

cat /zookeeper/conf/zoo.cfg

cd /zookeeper
exec "$@"
