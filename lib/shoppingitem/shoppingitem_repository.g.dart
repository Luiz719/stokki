// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoppingitem_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingitemRepository)
const shoppingitemRepositoryProvider = ShoppingitemRepositoryProvider._();

final class ShoppingitemRepositoryProvider
    extends
        $FunctionalProvider<
          ShoppingitemRepository,
          ShoppingitemRepository,
          ShoppingitemRepository
        >
    with $Provider<ShoppingitemRepository> {
  const ShoppingitemRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingitemRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingitemRepositoryHash();

  @$internal
  @override
  $ProviderElement<ShoppingitemRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShoppingitemRepository create(Ref ref) {
    return shoppingitemRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingitemRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingitemRepository>(value),
    );
  }
}

String _$shoppingitemRepositoryHash() =>
    r'c5a7e3fa2da5fe94958e3a069347ac8ce6d61adb';
