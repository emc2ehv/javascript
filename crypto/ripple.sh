#!/bin/sh -x
export http_proxy=http://rmdc-proxy.oracle.com:80
export HTTPS_PROXY=http://rmdc-proxy.oracle.com:80
export https_proxy=http://rmdc-proxy.oracle.com:80
export no_proxy=us.oracle.com,labs.nc.tekelec.com,localhost,127.0.0.1
export HTTP_PROXY=http://rmdc-proxy.oracle.com:80
xrpbtc=$(curl -s https://api.binance.com/api/v1/ticker/price?symbol=XRPBTC|jq .price --raw-output)
btcusdt=$(curl -s https://api.binance.com/api/v1/ticker/price?symbol=BTCUSDT|jq .price --raw-output)
xrpusdt=$(echo "$xrpbtc * $btcusdt"| bc)
echo "$xrpusdt" >> /var/www/html/ripple.csv
