// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider que fornece a instância do cliente Supabase para toda a aplicação.
/// Como o Supabase é inicializado no main(), aqui apenas retornamos a instância.

@ProviderFor(supabase)
const supabaseProvider = SupabaseProvider._();

/// Provider que fornece a instância do cliente Supabase para toda a aplicação.
/// Como o Supabase é inicializado no main(), aqui apenas retornamos a instância.

final class SupabaseProvider
    extends $FunctionalProvider<SupabaseClient, SupabaseClient, SupabaseClient>
    with $Provider<SupabaseClient> {
  /// Provider que fornece a instância do cliente Supabase para toda a aplicação.
  /// Como o Supabase é inicializado no main(), aqui apenas retornamos a instância.
  const SupabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseHash();

  @$internal
  @override
  $ProviderElement<SupabaseClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SupabaseClient create(Ref ref) {
    return supabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseClient>(value),
    );
  }
}

String _$supabaseHash() => r'bf569ca6e718c2eaa4101f9a8cfab3a761fba195';
