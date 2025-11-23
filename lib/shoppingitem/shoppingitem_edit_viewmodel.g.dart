// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoppingitem_edit_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShoppingitemEditViewModel)
const shoppingitemEditViewModelProvider = ShoppingitemEditViewModelFamily._();

final class ShoppingitemEditViewModelProvider
    extends $AsyncNotifierProvider<ShoppingitemEditViewModel, Shoppingitem> {
  const ShoppingitemEditViewModelProvider._({
    required ShoppingitemEditViewModelFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'shoppingitemEditViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$shoppingitemEditViewModelHash();

  @override
  String toString() {
    return r'shoppingitemEditViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ShoppingitemEditViewModel create() => ShoppingitemEditViewModel();

  @override
  bool operator ==(Object other) {
    return other is ShoppingitemEditViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shoppingitemEditViewModelHash() =>
    r'7135d882c81c5a169ec0069696356d8e61e90781';

final class ShoppingitemEditViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ShoppingitemEditViewModel,
          AsyncValue<Shoppingitem>,
          Shoppingitem,
          FutureOr<Shoppingitem>,
          int?
        > {
  const ShoppingitemEditViewModelFamily._()
    : super(
        retry: null,
        name: r'shoppingitemEditViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ShoppingitemEditViewModelProvider call(int? shoppingitemId) =>
      ShoppingitemEditViewModelProvider._(argument: shoppingitemId, from: this);

  @override
  String toString() => r'shoppingitemEditViewModelProvider';
}

abstract class _$ShoppingitemEditViewModel
    extends $AsyncNotifier<Shoppingitem> {
  late final _$args = ref.$arg as int?;
  int? get shoppingitemId => _$args;

  FutureOr<Shoppingitem> build(int? shoppingitemId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<Shoppingitem>, Shoppingitem>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Shoppingitem>, Shoppingitem>,
              AsyncValue<Shoppingitem>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
