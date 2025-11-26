import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_provider.g.dart';

const _themeKey = 'isDarkMode';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError('Deve ser sobrescrito no main.dart');
}

@riverpod
class ThemeController extends _$ThemeController {
  @override
  bool build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getBool(_themeKey) ?? false;
  }

  void toggleTheme() {
    state = !state; 
    ref.read(sharedPreferencesProvider).setBool(_themeKey, state);
  }
}