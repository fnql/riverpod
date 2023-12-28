part of '../framework.dart';

/// A typedef representing the constructor of any classical provider.
@internal
typedef ProviderCreate<ProviderT, Created, RefT extends Ref> = ProviderT
    Function(
  Create<Created, RefT> create, {
  required String? name,
  required Iterable<ProviderOrFamily>? dependencies,
  required Set<ProviderOrFamily>? allTransitiveDependencies,
  required DebugGetCreateSourceHash? debugGetCreateSourceHash,
  Family from,
  Object? argument,
});

/// A typedef representing the constructor of a [NotifierProvider].
@internal
typedef ProviderNotifierCreate<ProviderT, Created, RefT extends Ref> = ProviderT
    Function(
  Created Function() create, {
  required String? name,
  required Iterable<ProviderOrFamily>? dependencies,
  required Set<ProviderOrFamily>? allTransitiveDependencies,
  required DebugGetCreateSourceHash? debugGetCreateSourceHash,
  Family from,
  Object? argument,
});

/// A [Create] equivalent used by [Family].
@internal
typedef FamilyCreate<T, R extends Ref, Arg> = T Function(R ref, Arg arg);

/// A base class for all families
abstract class Family implements _FamilyOverride, ProviderOrFamily {
  /// A base class for all families
  const Family();

  @override
  Family get from => this;
}

/// Setup how a family is overridden
@internal
typedef SetupFamilyOverride<Arg> = void Function(
  Arg argument,
  void Function({
    required ProviderBase<Object?> origin,
    required ProviderBase<Object?> override,
  }),
);

/// A base implementation for [Family], used by the various providers to
/// help them define a [Family].
///
/// This API is not meant for public consumption.
@internal
class FamilyBase<RefT extends Ref<R>, R, Arg, Created,
    ProviderT extends ProviderBase<R>> extends Family {
  /// A base implementation for [Family], used by the various providers to
  /// help them define a [Family].
  ///
  /// This API is not meant for public consumption.
  const FamilyBase(
    this._createFn, {
    required ProviderCreate<ProviderT, Created, RefT> providerFactory,
    required this.name,
    required this.dependencies,
    required this.allTransitiveDependencies,
    required this.debugGetCreateSourceHash,
  }) : _providerFactory = providerFactory;

  final ProviderCreate<ProviderT, Created, RefT> _providerFactory;

  final Created Function(RefT ref, Arg arg) _createFn;

  /// {@template family.call}
  /// Create a provider from an external value.
  ///
  /// That external value should be immutable and preferably override `==`/`hashCode`.
  /// See the documentation of [Provider.family] for more information.
  /// {@endtemplate}
  ProviderT call(Arg argument) {
    return _providerFactory(
      (ref) => _createFn(ref, argument),
      name: name,
      from: this,
      argument: argument,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
    );
  }

  @override
  final String? name;
  @override
  final Iterable<ProviderOrFamily>? dependencies;
  @override
  final Set<ProviderOrFamily>? allTransitiveDependencies;

  /// {@macro riverpod.create_source_hash}
  @internal
  final DebugGetCreateSourceHash? debugGetCreateSourceHash;
}

/// A base implementation for [Family], used by the various providers to
/// help them define a [Family].
///
/// This API is not meant for public consumption.

@internal
class AutoDisposeFamilyBase<RefT extends Ref<R>, R, Arg, Created,
    ProviderT extends ProviderBase<R>> extends Family {
  /// A base implementation for [Family], used by the various providers to
  /// help them define a [Family].
  ///
  /// This API is not meant for public consumption.
  const AutoDisposeFamilyBase(
    this._createFn, {
    required ProviderCreate<ProviderT, Created, RefT> providerFactory,
    required this.name,
    required this.dependencies,
    required this.allTransitiveDependencies,
    required this.debugGetCreateSourceHash,
  }) : _providerFactory = providerFactory;

  final ProviderCreate<ProviderT, Created, RefT> _providerFactory;

  final Created Function(RefT ref, Arg arg) _createFn;

  /// {@macro family.call}
  ProviderT call(Arg argument) {
    return _providerFactory(
      (ref) => _createFn(ref, argument),
      name: name,
      from: this,
      argument: argument,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
    );
  }

  @override
  final String? name;
  @override
  final Iterable<ProviderOrFamily>? dependencies;
  @override
  final Set<ProviderOrFamily>? allTransitiveDependencies;

  /// {@macro riverpod.create_source_hash}
  @internal
  final DebugGetCreateSourceHash? debugGetCreateSourceHash;
}

/// A base implementation for [Family] specific to autoDispose `Notifier`-based providers.
///
/// It offers a unique "create" function which does not take any argument.
///
/// This API is not meant for public consumption.
@internal
class AutoDisposeNotifierFamilyBase<RefT extends Ref<R>, R, Arg, NotifierT,
    ProviderT extends ProviderBase<R>> extends Family {
  /// A base implementation for [Family], used by the various providers to
  /// help them define a [Family].
  ///
  /// This API is not meant for public consumption.
  const AutoDisposeNotifierFamilyBase(
    this._createFn, {
    required ProviderNotifierCreate<ProviderT, NotifierT, RefT> providerFactory,
    required this.name,
    required this.dependencies,
    required this.allTransitiveDependencies,
    required this.debugGetCreateSourceHash,
  }) : _providerFactory = providerFactory;

  final ProviderNotifierCreate<ProviderT, NotifierT, RefT> _providerFactory;

  final NotifierT Function() _createFn;

  /// {@macro family.call}
  ProviderT call(Arg argument) {
    return _providerFactory(
      _createFn,
      name: name,
      from: this,
      argument: argument,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
    );
  }

  @override
  final String? name;
  @override
  final Iterable<ProviderOrFamily>? dependencies;
  @override
  final Set<ProviderOrFamily>? allTransitiveDependencies;

  /// {@macro riverpod.create_source_hash}
  @internal
  final DebugGetCreateSourceHash? debugGetCreateSourceHash;
}

/// A base implementation for [Family] specific to `Notifier`-based providers.
///
/// It offers a unique "create" function which does not take any argument.
///
/// This API is not meant for public consumption.
@internal
class NotifierFamilyBase<RefT extends Ref<R>, R, Arg, NotifierT,
    ProviderT extends ProviderBase<R>> extends Family {
  /// A base implementation for [Family], used by the various providers to
  /// help them define a [Family].
  ///
  /// This API is not meant for public consumption.
  const NotifierFamilyBase(
    this._createFn, {
    required ProviderNotifierCreate<ProviderT, NotifierT, RefT> providerFactory,
    required this.name,
    required this.dependencies,
    required this.allTransitiveDependencies,
    required this.debugGetCreateSourceHash,
  }) : _providerFactory = providerFactory;

  final ProviderNotifierCreate<ProviderT, NotifierT, RefT> _providerFactory;

  final NotifierT Function() _createFn;

  /// {@macro family.call}
  ProviderT call(Arg argument) {
    return _providerFactory(
      _createFn,
      name: name,
      from: this,
      argument: argument,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
    );
  }

  @override
  final String? name;
  @override
  final Iterable<ProviderOrFamily>? dependencies;
  @override
  final Set<ProviderOrFamily>? allTransitiveDependencies;

  /// {@macro riverpod.create_source_hash}
  @internal
  final DebugGetCreateSourceHash? debugGetCreateSourceHash;
}
