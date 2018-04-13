#!/bin/sh

opt=$1

usage () {
    echo "Usage: ./setup_ssl.sh [generate|clean]"
    exit 1
}

clean () {
    rm -rf volumes/ssl
}

generate () {
    clean
    mkdir -p volumes/ssl/client volumes/ssl/server
    cp sensu_ssl_tool.tar volumes/ssl/
    cd volumes/ssl
    tar -xvf sensu_ssl_tool.tar
    cd sensu_ssl_tool
    bash ./ssl_certs.sh generate
    cp ./sensu_ca/cacert.pem ./server/key.pem ./server/cert.pem ../server/
    cp ./client/key.pem ./client/cert.pem ../client/
    cd ..
    rm -rf sensu_ssl_tool sensu_ssl_tool.tar
    cd ../..
}

if [[ -z ${opt} ]] ; then
    usage
elif [[ ${opt} == "generate" ]] || [[ ${opt} == "clean" ]]; then
    eval ${opt}
else
    usage
fi
