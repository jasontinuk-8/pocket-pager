# Pocket Pager

A small multi-device pager-style messaging web app built as a Cloudflare Worker with a D1 database.

## Features

- Pair up to five devices with a room code.
- Send and read short messages from phones or computers.
- Receive optional Web Push notifications on supported browsers. On iPhone, add the site to the Home Screen first.
- Use the pager's translation key to translate the selected incoming message between Chinese and English. The original message remains in the conversation. When Translate is pressed, the selected text is sent to MyMemory; the app asks for consent the first time on each device.
- Use speech input while composing where the browser supports the Web Speech API. Cantonese (`yue-HK`) is requested. On iPhone browsers without that API, the voice button focuses the message field so iOS keyboard dictation can be used.

## Build

Run `bash scripts/build.sh`. The deployable Worker entrypoint is written to `dist/server/index.js`.

The hosted Site needs the D1 binding `DB` and the secret environment variable `VAPID_PRIVATE_KEY` for push notifications. The VAPID public key is included in the Worker source; never commit the private key.
