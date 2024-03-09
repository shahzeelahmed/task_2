// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************


typedef _$SSHClientProvider = AutoDisposeNotifier<SSHClient?>;
String _$connectToLGHash() => r'754817fbd5cc07bbf7acc0aae76552e4c4de0e5e';

/// See also [ConnectToLG].
@ProviderFor(ConnectToLG)
final connectToLGProvider = AsyncNotifierProvider<ConnectToLG, bool>.internal(
  ConnectToLG.new,
  name: r'connectToLGProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$connectToLGHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConnectToLG = AsyncNotifier<bool>;
String _$isConnectedHash() => r'd82360062c69eb2c4c87a9e253a19b915596dd42';

/// See also [IsConnected].
@ProviderFor(IsConnected)
final isConnectedProvider = NotifierProvider<IsConnected, bool>.internal(
  IsConnected.new,
  name: r'isConnectedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isConnectedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsConnected = Notifier<bool>;
String _$disconnectHash() => r'90e96b4bfaa393d85de553ffb46b4463198135dd';

/// See also [Disconnect].
@ProviderFor(Disconnect)
final disconnectProvider =
    AutoDisposeNotifierProvider<Disconnect, void>.internal(
  Disconnect.new,
  name: r'disconnectProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$disconnectHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Disconnect = AutoDisposeNotifier<void>;
String _$relaunchHash() => r'68d918d4abedb22e0b608dd1d4c4a836772fd98b';

/// See also [Relaunch].
@ProviderFor(Relaunch)
final relaunchProvider = AutoDisposeNotifierProvider<Relaunch, void>.internal(
  Relaunch.new,
  name: r'relaunchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$relaunchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Relaunch = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
