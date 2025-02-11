# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## 0.2.0 - 2021-07-21

### Added

 - Debug mode with metric `yabeda_prometheus_mmap_render_duration` to measure how long takes to render response with already collected metrics for Prometheus. Requires Yabeda 0.10+. [@Envek], [@dsalahutdinov]

### Changed

 - Yabeda 0.10.0 or newer is required. [@Envek]

## 0.1.2 - 2021-06-23

### Fixed

 - Fix `uninitialized constant Yabeda::Rack::Handler (NameError)` when using [yabeda-rack-attack](https://github.com/dsalahutdinov/yabeda-rack-attack). [@dsalahutdinov]

## 0.1.1 - 2020-08-04

### Fixed

- Fix mounting exporter in Rails routes. [#3](https://github.com/yabeda-rb/yabeda-prometheus-mmap/pull/3) by [@macchiang][]

## 0.1.0 - 2020-03-25

Initial release. [@dsalahutdinov][]

[@macchiang]: https://github.com/macchiang "Mac"
[@dsalahutdinov]: https://github.com/dsalahutdinov "Salahutdinov Dmitry"
[@Envek]: https://github.com/Envek "Andrey Novikov"
