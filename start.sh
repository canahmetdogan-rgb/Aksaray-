#!/bin/bash

RADIO="https://sslyayin.netyayin.net/aksarayinsesi/stream/"
IMAGE="image.jpg"

ffmpeg \
-reconnect 1 \
-reconnect_streamed 1 \
-reconnect_delay_max 30 \
-i "$RADIO" \
-loop 1 \
-framerate 2 \
-i "$IMAGE" \
-map 1:v:0 \
-map 0:a:0 \
-c:v libx264 \
-preset veryfast \
-tune stillimage \
-pix_fmt yuv420p \
-r 25 \
-c:a aac \
-b:a 128k \
-ar 44100 \
-f hls \
-hls_time 4 \
-hls_list_size 6 \
-hls_flags delete_segments \
playlist.m3u8
