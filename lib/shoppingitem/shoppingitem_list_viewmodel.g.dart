// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoppingitem_list_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShoppingitemListViewModel)
const shoppingitemListViewModelProvider = ShoppingitemListViewModelProvider._();

final class ShoppingitemListViewModelProvider
    extends
        $AsyncNotifierProvider<ShoppingitemListViewModel, List<Shoppingitem>> {
  const ShoppingitemListViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingitemListViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingitemListViewModelHash();

  @$internal
  @override
  ShoppingitemListViewModel create() => ShoppingitemListViewModel();
}

String _$shoppingitemListViewModelHash() =>
    r'05fb8a34bca158df31c23ba12e3ff4a78b65736b';

abstract class _$ShoppingitemListViewModel
    extends $AsyncNotifier<List<Shoppingitem>> {
  FutureOr<List<Shoppingitem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<Shoppingitem>>, List<Shoppingitem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Shoppingitem>>, List<Shoppingitem>>,
              AsyncValue<List<Shoppingitem>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
