#!/bin/bash

NITER=10

TCPOUT=tcp-10g.csv
XTCPOUT=xtcp-10g.csv
IPERFOUT=iperf-10g.csv

HEADER="pass,target,queue,size,ops,elapsed,bandwidth,iops,latency,cpu,op,reqsize"
echo ${HEADER} >${TCPOUT}
echo ${HEADER} >${XTCPOUT}
echo ${HEADER} >${IPERFOUT}
for i in `seq $NITER`
do
    ./remote-tcp-null.sh >>${TCPOUT}
    sleep 4
    ./remote-xtcp-null.sh >>${XTCPOUT}
    sleep 4
    ./remote-iperf-null.sh >>${IPERFOUT}
    sleep 4
done
