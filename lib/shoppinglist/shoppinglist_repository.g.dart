// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoppinglist_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppinglistRepository)
const shoppinglistRepositoryProvider = ShoppinglistRepositoryProvider._();

final class ShoppinglistRepositoryProvider
    extends
        $FunctionalProvider<
          ShoppinglistRepository,
          ShoppinglistRepository,
          ShoppinglistRepository
        >
    with $Provider<ShoppinglistRepository> {
  const ShoppinglistRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppinglistRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppinglistRepositoryHash();

  @$internal
  @override
  $ProviderElement<ShoppinglistRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShoppinglistRepository create(Ref ref) {
    return shoppinglistRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppinglistRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppinglistRepository>(value),
    );
  }
}

String _$shoppinglistRepositoryHash() =>
    r'b43c635291b4458c256337d3c658dbf4d9ab22a7';
