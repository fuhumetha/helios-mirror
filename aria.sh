tracker_list=$(curl -Ns https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/all.txt https://ngosang.github.io/trackerslist/trackers_all_http.txt https://newtrackon.com/api/all https://raw.githubusercontent.com/hezhijie0327/Trackerslist/main/trackerslist_tracker.txt | awk '$0' | tr '\n\n' ',')
aria2c --enable-rpc=true --check-certificate=false --daemon=false \
   --max-connection-per-server=5 --rpc-max-request-size=1024M --quiet=true \
   --bt-stop-timeout=180 --min-split-size=10M --split=5 --allow-overwrite=true \
   --max-overall-download-limit=0 --bt-tracker="[$tracker_list]" --disk-cache=128M \
   --max-overall-upload-limit=1K --max-concurrent-downloads=5 --summary-interval=0 \
   --peer-id-prefix=-qB4400- --user-agent=Wget/1.12 --peer-agent=qBittorrent/4.4.0 \
   --bt-enable-lpd=true --seed-time=0 --max-file-not-found=0 --max-tries=20 \
   --auto-file-renaming=true --reuse-uri=true --http-accept-gzip=true --continue=true \
   --content-disposition-default-utf8=true --netrc-path=/usr/src/app/.netrc
