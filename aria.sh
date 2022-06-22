if [ -z $TORRENT_TIMEOUT ]
then
   TORRENT_TIMEOUT=0
fi
TRACKERS=$(curl -Ns https://raw.githubusercontent.com/devillD/trackers/main/aria.txt)
USERAGENT=$(echo "Mozilla/5.0 (Linux; Android 12; SM-A205U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.78 Mobile Safari/537.36")
aria2c --enable-rpc=true --check-certificate=false --daemon=true \
   --max-connection-per-server=10 --rpc-max-request-size=1024M --quiet=true \
   --bt-stop-timeout=$TORRENT_TIMEOUT --min-split-size=10M --split=10 --allow-overwrite=true \
   --max-overall-download-limit=0 --bt-tracker="[$TRACKERS]" --disk-cache=32M --rpc-listen-port=7389 \
   --max-overall-upload-limit=1K --max-concurrent-downloads=15 --summary-interval=0 \
   --peer-id-prefix=-qB4420- --user-agent="[$USERAGENT]" --peer-agent=qBittorrent/4.4.2 \
   --bt-enable-lpd=true --seed-time=0 --max-file-not-found=0 --max-tries=20 \
   --auto-file-renaming=true --reuse-uri=true --http-accept-gzip=true --continue=true \
   --content-disposition-default-utf8=true --netrc-path=/usr/src/app/.netrc
