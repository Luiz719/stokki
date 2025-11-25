// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoppinglist_list_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShoppinglistListViewModel)
const shoppinglistListViewModelProvider = ShoppinglistListViewModelProvider._();

final class ShoppinglistListViewModelProvider
    extends
        $AsyncNotifierProvider<ShoppinglistListViewModel, List<Shoppinglist>> {
  const ShoppinglistListViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppinglistListViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppinglistListViewModelHash();

  @$internal
  @override
  ShoppinglistListViewModel create() => ShoppinglistListViewModel();
}

String _$shoppinglistListViewModelHash() =>
    r'199cb038acd22ddf41c47f4afeaece6efbc61bb6';

abstract class _$ShoppinglistListViewModel
    extends $AsyncNotifier<List<Shoppinglist>> {
  FutureOr<List<Shoppinglist>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<Shoppinglist>>, List<Shoppinglist>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Shoppinglist>>, List<Shoppinglist>>,
              AsyncValue<List<Shoppinglist>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
