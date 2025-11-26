import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_provider.g.dart';

// Chave para salvar no disco
const _themeKey = 'isDarkMode';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError('Deve ser sobrescrito no main.dart');
}

@riverpod
class ThemeController extends _$ThemeController {
  @override
  bool build() {
    // Lê o valor salvo. Se não existir, retorna false (Modo Claro)
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getBool(_themeKey) ?? false;
  }

  void toggleTheme() {
    state = !state; // Inverte o estado atual
    // Salva a nova preferência
    ref.read(sharedPreferencesProvider).setBool(_themeKey, state);
  }
}