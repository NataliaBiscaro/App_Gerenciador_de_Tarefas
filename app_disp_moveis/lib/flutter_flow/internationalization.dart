import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'e4of56yw': {
      'pt': 'Login',
      'en': '',
    },
    'qbijzaoy': {
      'pt': 'LOGIN',
      'en': '',
    },
    '2wix7ccp': {
      'pt': 'E-mail',
      'en': '',
    },
    'q0qkcdqj': {
      'pt': 'Senha',
      'en': '',
    },
    'pfnhr64d': {
      'pt': 'Entrar',
      'en': '',
    },
    'ah7xfxxx': {
      'pt': 'Cadastre-se',
      'en': '',
    },
    'k2nf33wi': {
      'pt': 'E-mail',
      'en': '',
    },
    '5l7hg991': {
      'pt': 'Informe seu endereço de e-mail',
      'en': '',
    },
    'c836pkxf': {
      'pt': 'Senha',
      'en': '',
    },
    '0t8o3wh4': {
      'pt': 'Defina uma senha',
      'en': '',
    },
    '18dcd152': {
      'pt': 'Confirmar senha',
      'en': '',
    },
    'wrci1k7t': {
      'pt': 'Confirme a sua senha',
      'en': '',
    },
    'kt6so9lk': {
      'pt': 'Cadastrar',
      'en': '',
    },
  },
  // CadastroDeTarefas
  {
    '4k7ro7xb': {
      'pt': 'Titulo',
      'en': '',
    },
    'madtxxz4': {
      'pt': 'Descrição',
      'en': '',
    },
    '3kfy6w4w': {
      'pt': 'Data',
      'en': '',
    },
    'rn77tn14': {
      'pt': 'Baixa',
      'en': '',
    },
    'l1ww9gbr': {
      'pt': 'Média',
      'en': '',
    },
    '0zygz1ko': {
      'pt': 'Alta',
      'en': '',
    },
    'sg5j243a': {
      'pt': 'Prioridade...',
      'en': '',
    },
    'a9am641j': {
      'pt': 'Search for an item...',
      'en': '',
    },
    'hnmr5m9c': {
      'pt': 'Adicione uma imagem:',
      'en': '',
    },
    'q9lloscb': {
      'pt': '**Ao realizar o upload de uma imagem, aguarde alguns segundos.',
      'en': '',
    },
    '38g31cgu': {
      'pt': 'Salvar',
      'en': '',
    },
    'tb16w1zz': {
      'pt': 'Nova Tarefa',
      'en': '',
    },
    '1uh8shc9': {
      'pt': 'Criar',
      'en': '',
    },
  },
  // logoutPage
  {
    'e2f54vu0': {
      'pt': 'Sair',
      'en': '',
    },
  },
  // HOMEPAGECALENDAR
  {
    'euokjok0': {
      'pt': 'Baixa',
      'en': '',
    },
    'jbt0p9uj': {
      'pt': 'Média',
      'en': '',
    },
    '6r3kblpd': {
      'pt': 'Alta',
      'en': '',
    },
    'ruy79o2p': {
      'pt': 'Calendário',
      'en': '',
    },
  },
  // HOMEPAGECALENDARCopy
  {
    'hhbf5naf': {
      'pt': 'Baixa',
      'en': '',
    },
    'vjee38hk': {
      'pt': 'Média',
      'en': '',
    },
    'lh8pbr4u': {
      'pt': 'Alta',
      'en': '',
    },
    'ardabhiv': {
      'pt': 'Clique na imagem para expandir',
      'en': '',
    },
    '5f21wwdp': {
      'pt': 'Minhas Tarefas:',
      'en': '',
    },
    'wqbrk6wk': {
      'pt': 'Tarefas',
      'en': '',
    },
  },
  // popupEditarTarefa
  {
    '0vkb41st': {
      'pt': 'Editar tarefa:',
      'en': '',
    },
    'chfikzq8': {
      'pt': 'Título',
      'en': '',
    },
    '3807u04e': {
      'pt': 'Descrição',
      'en': '',
    },
    '051al9j5': {
      'pt': 'Data',
      'en': '',
    },
    '6anmnkk4': {
      'pt': 'Baixa',
      'en': '',
    },
    'q06if0ul': {
      'pt': 'Média',
      'en': '',
    },
    'cgvf6j5i': {
      'pt': 'Alta',
      'en': '',
    },
    'id8h42np': {
      'pt': 'Prioridade...',
      'en': '',
    },
    'in7sdp4l': {
      'pt': 'Search for an item...',
      'en': '',
    },
    'evfir06e': {
      'pt': '**Ao realizar o upload de uma imagem, aguarde',
      'en': '',
    },
    'n2gjdmlr': {
      'pt': ' alguns segundos.',
      'en': '',
    },
    'zi7f1d3m': {
      'pt': 'Salvar',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'dwrdh1js': {
      'pt': '',
      'en': '',
    },
    'iht8myxf': {
      'pt': '',
      'en': '',
    },
    'fs3l3qjn': {
      'pt': '',
      'en': '',
    },
    '5w0iwt0y': {
      'pt': '',
      'en': '',
    },
    '61kicfwc': {
      'pt': '',
      'en': '',
    },
    '0yyj8sq2': {
      'pt': '',
      'en': '',
    },
    'fag61pu1': {
      'pt': '',
      'en': '',
    },
    'ngd8nx6e': {
      'pt': '',
      'en': '',
    },
    'f6gfn6bs': {
      'pt': '',
      'en': '',
    },
    'bqi3n242': {
      'pt': '',
      'en': '',
    },
    '4gzefqem': {
      'pt': '',
      'en': '',
    },
    'e2v8gduy': {
      'pt': '',
      'en': '',
    },
    'p1210ymm': {
      'pt': '',
      'en': '',
    },
    'da33qin4': {
      'pt': '',
      'en': '',
    },
    'svacmo8z': {
      'pt': '',
      'en': '',
    },
    'dnk0tqcr': {
      'pt': '',
      'en': '',
    },
    'dka6y0g4': {
      'pt': '',
      'en': '',
    },
    'li2apjx0': {
      'pt': '',
      'en': '',
    },
    '00a8ivr5': {
      'pt': '',
      'en': '',
    },
    '1olypzkt': {
      'pt': '',
      'en': '',
    },
    'g37xj595': {
      'pt': '',
      'en': '',
    },
    'bj4w3x5y': {
      'pt': '',
      'en': '',
    },
    '8ebyfpvp': {
      'pt': '',
      'en': '',
    },
    'jthjz7ah': {
      'pt': '',
      'en': '',
    },
    'qu21r24e': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
