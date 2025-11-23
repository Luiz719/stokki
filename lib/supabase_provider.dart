import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_provider.g.dart';

/// Provider que fornece a instância do cliente Supabase para toda a aplicação.
/// Como o Supabase é inicializado no main(), aqui apenas retornamos a instância.
@Riverpod(keepAlive: true)
SupabaseClient supabase(Ref ref) {
  return Supabase.instance.client;
}

/// Inicialização no main.dart (Exemplo)
/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'SUA_URL_DO_SUPABASE',
    anonKey: 'SUA_ANON_KEY_DO_SUPABASE',
  );

  runApp(const ProviderScope(child: MyApp()));
}
*/