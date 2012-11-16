# GoodWriter

This is experimetal project. ;)

By [Oto Brglez](https://github.com/otobrglez)

# What you need?

- Ruby >= 1.9.3
- Redis

# How it works?

- **Submiter** listens to Redis queue and waits for work
- **App** is simple Sinatra app that dispatches work and shows results