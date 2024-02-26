// ignore_for_file: avoid_types_on_closure_parameters

import 'package:mockito/mockito.dart';
import 'package:riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod/src/internals.dart' show ProviderElementBase;
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('supports overrideWith', () {
    final provider = StateProvider<int>(
      (ref) => 0,
    );
    final autoDispose = StateProvider.autoDispose<int>(
      (ref) => 0,
    );
    final container = ProviderContainer.test(
      overrides: [
        provider.overrideWith((StateProviderRef<int> ref) => 42),
        autoDispose.overrideWith((StateProviderRef<int> ref) => 84),
      ],
    );

    expect(container.read(provider), 42);
    expect(container.read(autoDispose), 84);
  });

  test('supports family overrideWith', () {
    final family = StateProvider.family<String, int>((ref, arg) => '0 $arg');
    final autoDisposeFamily = StateProvider.autoDispose.family<String, int>(
      (ref, arg) => '0 $arg',
    );
    final container = ProviderContainer.test(
      overrides: [
        family.overrideWith(
          (StateProviderRef<String> ref, int arg) => '42 $arg',
        ),
        autoDisposeFamily.overrideWith(
          (StateProviderRef<String> ref, int arg) => '84 $arg',
        ),
      ],
    );

    expect(container.read(family(10)), '42 10');
    expect(container.read(autoDisposeFamily(10)), '84 10');
  });

  test(
      'on refresh, does not notify listeners if the new value is identical to the previous one',
      () {
    // regression test for https://github.com/rrousselGit/riverpod/issues/1560
    final container = ProviderContainer.test();
    final provider = StateProvider((ref) => 0);
    final listener = Listener<int>();

    container.listen(provider, listener.call, fireImmediately: true);

    verifyOnly(listener, listener(null, 0));

    container.refresh(provider);

    verifyNoMoreInteractions(listener);
  });

  test('ref.listenSelf listens to state changes', () {
    final listener = Listener<int>();
    final container = ProviderContainer.test();
    final provider = StateProvider<int>((ref) {
      ref.listenSelf(listener.call);
      return 0;
    });

    final notifier = container.read(provider.notifier);

    verifyOnly(listener, listener(null, 0));

    notifier.state++;

    verifyOnly(listener, listener(0, 1));
  });

  test('supports .name', () {
    expect(
      StateProvider((ref) => 0).name,
      null,
    );
    expect(
      StateProvider((ref) => 0, name: 'foo').name,
      'foo',
    );
  });

  test('can be auto-scoped', () async {
    final dep = Provider(
      (ref) => 0,
      dependencies: const [],
    );
    final provider = StateProvider(
      (ref) => ref.watch(dep),
      dependencies: [dep],
    );
    final root = ProviderContainer.test();
    final container = ProviderContainer.test(
      parent: root,
      overrides: [dep.overrideWithValue(42)],
    );

    expect(container.read(provider), 42);
    expect(container.read(provider.notifier).state, 42);

    expect(root.getAllProviderElements(), isEmpty);
  });

  group('ref.controller', () {
    test('can read and change current value', () {
      final container = ProviderContainer.test();
      final listener = Listener<int>();
      late StateProviderRef<int> ref;
      final provider = StateProvider<int>((r) {
        ref = r;
        return 0;
      });

      container.listen<int>(provider, listener.call);
      verifyZeroInteractions(listener);

      expect(ref.controller, container.read(provider.notifier));

      ref.controller.state = 42;

      verifyOnly(listener, listener(0, 42));

      expect(ref.controller.state, 42);
    });

    test('fails if trying to read the state before it was set', () {
      final container = ProviderContainer.test();
      Object? err;
      final provider = StateProvider<int>((ref) {
        try {
          ref.controller;
        } catch (e) {
          err = e;
        }
        return 0;
      });

      container.read(provider);
      expect(err, isStateError);
    });

    test('on rebuild, still fails if trying to read the state before was built',
        () {
      final dep = StateProvider((ref) => false);
      final container = ProviderContainer.test();
      Object? err;
      final provider = StateProvider<int>((ref) {
        if (ref.watch(dep)) {
          try {
            ref.controller;
          } catch (e) {
            err = e;
          }
        }
        return 0;
      });

      container.read(provider);
      expect(err, isNull);

      container.read(dep.notifier).state = true;
      container.read(provider);

      expect(err, isStateError);
    });
  });

  test('can refresh .notifier', () async {
    var initialValue = 1;
    final provider = StateProvider<int>((ref) => initialValue);
    final container = ProviderContainer.test();

    expect(container.read(provider), 1);
    expect(container.read(provider.notifier).state, 1);

    initialValue = 42;

    expect(container.refresh(provider.notifier).state, 42);
    expect(container.read(provider), 42);
  });

  test(
    'can refresh .state',
    skip: 'TODO',
    () async {
      // TODO fix this test
      var initialValue = 1;
      final provider = StateProvider<int>((ref) => initialValue);
      final container = ProviderContainer.test();

      expect(container.read(provider), 1);
      expect(container.read(provider.notifier).state, 1);

      initialValue = 42;

      expect(container.refresh(provider.notifier).state, 42);
      expect(container.read(provider), 42);
    },
  );

  test('can be refreshed', () async {
    var result = 0;
    final container = ProviderContainer.test();
    final provider = StateProvider<int>((ref) => result);

    final notifier = container.read(provider.notifier);
    expect(container.read(provider), 0);
    expect(notifier.state, 0);

    result = 42;
    expect(container.refresh(provider), 42);

    expect(container.read(provider), 42);
    expect(container.read(provider.notifier), isNot(notifier));
    expect(container.read(provider.notifier).state, 42);
  });

  group('scoping an override overrides all the associated subproviders', () {
    test('when passing the provider itself', () async {
      final provider = StateProvider<int>(
        (ref) => 0,
        dependencies: const [],
      );
      final root = ProviderContainer.test();
      final container = ProviderContainer.test(
        parent: root,
        overrides: [provider],
      );

      expect(container.read(provider.notifier).state, 0);
      expect(container.read(provider), 0);
      expect(root.getAllProviderElements(), isEmpty);
      expect(
        container.getAllProviderElements(),
        unorderedEquals(<Object?>[
          isA<ProviderElementBase<Object?>>()
              .having((e) => e.origin, 'origin', provider),
        ]),
      );
    });

    // test('when using provider.overrideWithValue', () async {
    //   final provider = StateProvider<int>((ref) => 0);
    //   final root = ProviderContainer.test();
    //   final container = ProviderContainer.test(parent: root, overrides: [
    //     provider.overrideWithValue(StateController(42)),
    //   ]);

    //   expect(container.read(provider.notifier).state, 42);
    //   expect(container.read(provider), 42);
    //   expect(root.getAllProviderElements(), isEmpty);
    //   expect(
    //     container.getAllProviderElements(),
    //     unorderedEquals(<Object?>[
    //       isA<ProviderElementBase<Object?>>()
    //           .having((e) => e.origin, 'origin', provider.state),
    //       isA<ProviderElementBase<Object?>>()
    //           .having((e) => e.origin, 'origin', provider.notifier),
    //     ]),
    //   );
    // });

    test('when using provider.overrideWith', () async {
      final provider = StateProvider<int>(
        (ref) => 0,
        dependencies: const [],
      );
      final root = ProviderContainer.test();
      final container = ProviderContainer.test(
        parent: root,
        overrides: [
          provider.overrideWith((ref) => 42),
        ],
      );

      expect(container.read(provider.notifier).state, 42);
      expect(container.read(provider), 42);
      expect(root.getAllProviderElements(), isEmpty);
      expect(
        container.getAllProviderElements(),
        unorderedEquals(<Object?>[
          isA<ProviderElementBase<Object?>>()
              .having((e) => e.origin, 'origin', provider),
        ]),
      );
    });
  });

  // test(
  //   'overrideWithValue listens to the new StateController and support controller changes',
  //   () {
  //     final provider = StateProvider((ref) => 0);
  //     final container = ProviderContainer.test(overrides: [
  //       provider.overrideWithValue(StateController(42)),
  //     ]);
  //     final listener = Listener<int>();

  //     container.listen<StateController<int>>(
  //       provider.state,
  //       (prev, controller) => listener(prev?.state, controller.state),
  //       fireImmediately: true,
  //     );

  //     verifyOnly(listener, listener(null, 42));

  //     container.read(provider.notifier).state++;

  //     verifyOnly(listener, listener(43, 43));
  //   },
  // );

  group('overrideWith', () {
    // test('listens to state changes', () {
    //   final override = StateController(21);
    //   final provider = StateProvider((ref) => 0);
    //   final container = ProviderContainer.test(overrides: [
    //     provider.overrideWithValue(override),
    //   ]);
    //   addTearDown(container.dispose);
    //   final container2 = ProviderContainer(overrides: [
    //     provider.overrideWith(
    //       ((ref) => 42),
    //     ),
    //   ]);
    //   addTearDown(container.dispose);

    //   expect(container.read(provider.notifier), override);
    //   expect(container.read(provider), 21);
    //   expect(container2.read(provider), 42);
    // });

    test(
      'properly disposes of the StateController when the provider is disposed',
      () async {
        final container = ProviderContainer.test();
        final provider = StateProvider.autoDispose((ref) => 0);

        final notifier = container.read(provider.notifier);
        final sub = container.listen(provider, (pref, value) {});

        expect(notifier.hasListeners, true);

        sub.close();
        await container.pump();

        expect(() => notifier.hasListeners, throwsStateError);
      },
    );
  });

  test('Expose a state and allows modifying it', () {
    final container = ProviderContainer.test();
    final provider = StateProvider((ref) => 0);
    final listener = Listener<int>();

    final controller = container.read(provider.notifier);
    expect(controller.state, 0);

    container.listen(provider, listener.call, fireImmediately: true);
    verifyOnly(listener, listener(null, 0));

    controller.state = 42;

    verifyOnly(listener, listener(0, 42));
  });

  test('disposes the controller when the container is disposed', () {
    final container = ProviderContainer.test();
    final provider = StateProvider((ref) => 0);

    final controller = container.read(provider.notifier);

    expect(controller.mounted, true);

    container.dispose();

    expect(controller.mounted, false);
  });

  test('disposes the controller when the provider is re-evaluated', () {
    final container = ProviderContainer.test();
    final other = StateProvider((ref) => 0);
    final provider = StateProvider((ref) => ref.watch(other) * 2);

    final otherController = container.read(other.notifier);
    final firstController = container.read(provider.notifier);

    final sub = container.listen(provider.notifier, (_, __) {});

    expect(sub.read(), firstController);
    expect(firstController.mounted, true);

    otherController.state++;

    final secondController = sub.read();
    expect(secondController, isNot(firstController));
    expect(secondController.mounted, true);
    expect(secondController.state, 2);
    expect(firstController.mounted, false);
  });

  group('StateProvider', () {
    test('.notifier obtains the controller without listening to it', () async {
      final container = ProviderContainer.test();
      final dep = StateProvider((ref) => 0);
      final provider = StateProvider((ref) {
        ref.watch(dep);
        return 0;
      });

      var callCount = 0;
      final sub = container.listen(
        provider.notifier,
        (_, __) => callCount++,
      );

      final controller = container.read(provider.notifier);

      expect(sub.read(), controller);
      expect(callCount, 0);

      controller.state++;

      await container.pump();
      expect(callCount, 0);

      container.read(dep.notifier).state++;

      final controller2 = container.read(provider.notifier);
      expect(controller2, isNot(controller));

      await container.pump();
      expect(sub.read(), controller2);
      expect(callCount, 1);
    });
  });

  group('StateProvider.autoDispose', () {
    test('.notifier obtains the controller without listening to it', () async {
      final container = ProviderContainer.test();
      final dep = StateProvider((ref) => 0);
      final provider = StateProvider.autoDispose((ref) {
        ref.watch(dep);
        return 0;
      });

      var callCount = 0;
      final sub = container.listen(
        provider.notifier,
        (_, __) => callCount++,
      );

      final controller = container.read(provider.notifier);

      expect(sub.read(), controller);
      expect(callCount, 0);

      controller.state++;

      await container.pump();
      expect(callCount, 0);

      container.read(dep.notifier).state++;

      final controller2 = container.read(provider.notifier);
      expect(controller2, isNot(controller));

      await container.pump();
      expect(sub.read(), controller2);
      expect(callCount, 1);
    });

    test('creates a new controller when no longer listened to', () async {
      final container = ProviderContainer.test();
      final provider = StateProvider.autoDispose((ref) => 0);

      final sub = container.listen(provider.notifier, (_, __) {});
      final first = sub.read();

      first.state++;
      expect(first.state, 1);
      expect(first.mounted, true);

      sub.close();
      await container.pump();

      final second = container.read(provider.notifier);

      expect(first.mounted, false);
      expect(second, isNot(first));
      expect(second.state, 0);
      expect(second.mounted, true);
    });
  });

  group('StateProvider.family.autoDispose', () {
    test('creates a new controller when no longer listened to', () async {
      final container = ProviderContainer.test();

      StateProvider.family.autoDispose<int, String>((ref, id) {
        return 42;
      });

      final provider =
          StateProvider.autoDispose.family<int, int>((ref, id) => id);

      final sub = container.listen(provider(0).notifier, (_, __) {});
      final sub2 = container.listen(provider(42).notifier, (_, __) {});
      final first = sub.read();

      first.state++;
      expect(sub2.read().state, 42);
      expect(first.state, 1);
      expect(first.mounted, true);

      sub.close();
      await container.pump();

      final second = container.read(provider(0).notifier);

      expect(first.mounted, false);
      expect(second, isNot(first));
      expect(second.state, 0);
      expect(second.mounted, true);
    });
  });
}