// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avoid_build_context_in_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fnHash() => r'7b8d0cf179067c80b8553b3232fd886fac83f387';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fn].
@ProviderFor(fn)
const fnProvider = FnFamily();

/// See also [fn].
class FnFamily extends Family {
  /// See also [fn].
  const FnFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fnProvider';

  /// See also [fn].
  FnProvider call(
    BuildContext context1, {
    required BuildContext context2,
  }) {
    return FnProvider(
      context1,
      context2: context2,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(int Function(FnRef ref) create) {
    return _$FnFamilyOverride(this, create);
  }

  @override
  String toString() => 'fnProvider';
}

class _$FnFamilyOverride implements FamilyOverride {
  _$FnFamilyOverride(this.from, this.create);

  final int Function(FnRef ref) create;

  @override
  final FnFamily from;

  @override
  _FnProviderElement createElement(
    ProviderContainer container,
    covariant FnProvider provider,
  ) {
    return provider._copyWith(create).createElement(container);
  }

  @override
  String toString() => 'fnProvider.overrideWith($create)';
}

/// See also [fn].
class FnProvider extends AutoDisposeProvider<int> {
  /// See also [fn].
  FnProvider(
    BuildContext context1, {
    required BuildContext context2,
  }) : this._internal(
          (ref) => fn(
            ref as FnRef,
            context1,
            context2: context2,
          ),
          from: fnProvider,
          name: r'fnProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$fnHash,
          dependencies: FnFamily._dependencies,
          allTransitiveDependencies: FnFamily._allTransitiveDependencies,
          context1: context1,
          context2: context2,
        );

  FnProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context1,
    required this.context2,
  }) : super.internal();

  final BuildContext context1;
  final BuildContext context2;

  @override
  Override overrideWith(
    int Function(FnRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      providerOverride: FnProvider._internal(
        (ref) => create(ref as FnRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context1: context1,
        context2: context2,
      ),
    );
  }

  @override
  (
    BuildContext, {
    BuildContext context2,
  }) get argument {
    return (
      context1,
      context2: context2,
    );
  }

  @override
  _FnProviderElement createElement(
    ProviderContainer container,
  ) {
    return _FnProviderElement(this, container);
  }

  FnProvider _copyWith(
    int Function(FnRef ref) create,
  ) {
    return FnProvider._internal(
      (ref) => create(ref as FnRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      context1: context1,
      context2: context2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FnProvider &&
        other.context1 == context1 &&
        other.context2 == context2;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context1.hashCode);
    hash = _SystemHash.combine(hash, context2.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  String toString() => 'fnProvider$argument';
}

mixin FnRef on AutoDisposeProviderRef<int> {
  /// The parameter `context1` of this provider.
  BuildContext get context1;

  /// The parameter `context2` of this provider.
  BuildContext get context2;
}

class _FnProviderElement extends AutoDisposeProviderElement<int> with FnRef {
  _FnProviderElement(super.provider, super.container);

  @override
  BuildContext get context1 => (origin as FnProvider).context1;
  @override
  BuildContext get context2 => (origin as FnProvider).context2;
}

String _$myNotifierHash() => r'04a0cf33dbda80e3fa80748fe46546b1c968da22';

abstract class _$MyNotifier extends BuildlessAutoDisposeNotifier<int> {
  late final BuildContext context1;
  late final BuildContext context2;

  int build(
    BuildContext context1, {
    required BuildContext context2,
  });
}

/// See also [MyNotifier].
@ProviderFor(MyNotifier)
const myNotifierProvider = MyNotifierFamily();

/// See also [MyNotifier].
class MyNotifierFamily extends Family {
  /// See also [MyNotifier].
  const MyNotifierFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'myNotifierProvider';

  /// See also [MyNotifier].
  MyNotifierProvider call(
    BuildContext context1, {
    required BuildContext context2,
  }) {
    return MyNotifierProvider(
      context1,
      context2: context2,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(MyNotifier Function() create) {
    return _$MyNotifierFamilyOverride(this, create);
  }

  @override
  String toString() => 'myNotifierProvider';
}

class _$MyNotifierFamilyOverride implements FamilyOverride {
  _$MyNotifierFamilyOverride(this.from, this.create);

  final MyNotifier Function() create;

  @override
  final MyNotifierFamily from;

  @override
  _MyNotifierProviderElement createElement(
    ProviderContainer container,
    covariant MyNotifierProvider provider,
  ) {
    return provider._copyWith(create).createElement(container);
  }

  @override
  String toString() => 'myNotifierProvider.overrideWith($create)';
}

/// See also [MyNotifier].
class MyNotifierProvider
    extends AutoDisposeNotifierProviderImpl<MyNotifier, int> {
  /// See also [MyNotifier].
  MyNotifierProvider(
    BuildContext context1, {
    required BuildContext context2,
  }) : this._internal(
          () => MyNotifier()
            ..context1 = context1
            ..context2 = context2,
          from: myNotifierProvider,
          name: r'myNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myNotifierHash,
          dependencies: MyNotifierFamily._dependencies,
          allTransitiveDependencies:
              MyNotifierFamily._allTransitiveDependencies,
          context1: context1,
          context2: context2,
        );

  MyNotifierProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context1,
    required this.context2,
  }) : super.internal();

  final BuildContext context1;
  final BuildContext context2;

  @override
  int runNotifierBuild(
    covariant MyNotifier notifier,
  ) {
    return notifier.build(
      context1,
      context2: context2,
    );
  }

  @override
  Override overrideWith(MyNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      providerOverride: MyNotifierProvider._internal(
        () => create()
          ..context1 = context1
          ..context2 = context2,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context1: context1,
        context2: context2,
      ),
    );
  }

  @override
  (
    BuildContext, {
    BuildContext context2,
  }) get argument {
    return (
      context1,
      context2: context2,
    );
  }

  @override
  _MyNotifierProviderElement createElement(
    ProviderContainer container,
  ) {
    return _MyNotifierProviderElement(this, container);
  }

  MyNotifierProvider _copyWith(
    MyNotifier Function() create,
  ) {
    return MyNotifierProvider._internal(
      () => create()
        ..context1 = context1
        ..context2 = context2,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      context1: context1,
      context2: context2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MyNotifierProvider &&
        other.context1 == context1 &&
        other.context2 == context2;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context1.hashCode);
    hash = _SystemHash.combine(hash, context2.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  String toString() => 'myNotifierProvider$argument';
}

mixin MyNotifierRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `context1` of this provider.
  BuildContext get context1;

  /// The parameter `context2` of this provider.
  BuildContext get context2;
}

class _MyNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<MyNotifier, int>
    with MyNotifierRef {
  _MyNotifierProviderElement(super.provider, super.container);

  @override
  BuildContext get context1 => (origin as MyNotifierProvider).context1;
  @override
  BuildContext get context2 => (origin as MyNotifierProvider).context2;
}

String _$regresion2959Hash() => r'bcf9a829ce75026a78569de680451d157c7d90a2';

/// See also [Regresion2959].
@ProviderFor(Regresion2959)
final regresion2959Provider =
    AutoDisposeNotifierProvider<Regresion2959, void>.internal(
  Regresion2959.new,
  name: r'regresion2959Provider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$regresion2959Hash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Regresion2959 = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
