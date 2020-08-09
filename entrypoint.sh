#! /bin/sh

echo "Downloading network snapshot..."
curl -k --output /app/guardian_mainnet/node/snapshot `curl -k 'https://mainnet-data.thetatoken.org/snapshot'`

echo "Running node..."
/app/bin/thetacli