# network_connectivity_bridge

A singleton-based bridge over [connectivity_plus](https://pub.dev/packages/connectivity_plus) to allow multiple listeners and global access to network status in a safe and conflict-free manner.

## ✨ Features

- Global singleton instance for connectivity monitoring
- Prevents multiple subscriptions from conflicting
- Simple `initialize()` method to set up once at app startup
- Provides a clean stream API for listening to changes
- Compatible with third-party packages also using `connectivity_plus`

## 🚀 Getting Started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  network_connectivity_bridge: ^0.1.1
