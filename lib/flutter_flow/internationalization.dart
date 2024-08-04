import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

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
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

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
  // events
  {
    'vvzy4pej': {
      'es': 'Amado',
      'en': '',
    },
    'p1oqzlxj': {
      'es': 'Eventos',
      'en': '',
    },
    'ls0cvxsd': {
      'es': 'U',
      'en': '',
    },
    'c1251khy': {
      'es': 'Amado',
      'en': '',
    },
    '7ol4f22e': {
      'es': 'Nuevo evento',
      'en': '',
    },
    'gqob92id': {
      'es': 'Cita con el medico',
      'en': '',
    },
    'mbeig1v1': {
      'es': '01/09/2024, 11:20am, 1hr',
      'en': '',
    },
    'pni37cmg': {
      'es': 'Aniversario de bodas',
      'en': '',
    },
    '2pmhbn73': {
      'es': '18/05, Todo el dia',
      'en': '',
    },
    'e2pfqc4i': {
      'es': 'Cumpleaños de mi hermano',
      'en': '',
    },
    '5j9pplsx': {
      'es': '30%',
      'en': '',
    },
    'rt7xtium': {
      'es': 'Home',
      'en': '',
    },
  },
  // createEvent
  {
    'fhma35x6': {
      'es': 'Amado',
      'en': '',
    },
    '82sy5fmy': {
      'es': 'Atras',
      'en': '',
    },
    '2cm32boy': {
      'es': 'Eventos',
      'en': '',
    },
    'atblziba': {
      'es': 'U',
      'en': '',
    },
    '3p2sdyme': {
      'es': 'Amado',
      'en': '',
    },
    'wlbhqoip': {
      'es': 'amado@example.com',
      'en': '',
    },
    '9xd5ak0b': {
      'es': 'Crear nuevo evento',
      'en': '',
    },
    'c1mh4mj8': {
      'es': 'Cita',
      'en': '',
    },
    '12y5tcnl': {
      'es': 'Programa una cita',
      'en': '',
    },
    'c6rkywdd': {
      'es': 'Ideal para agendar citas que no quieres olvidar',
      'en': '',
    },
    'tme34dei': {
      'es': 'Aniversario',
      'en': '',
    },
    'a7qkus3e': {
      'es': 'Recuerdatorio anual',
      'en': '',
    },
    'nwhgqfnn': {
      'es': 'Ideal para recordar fechas especiales',
      'en': '',
    },
    '74himcny': {
      'es': 'Cuenta Regresiva',
      'en': '',
    },
    'mzexyjc4': {
      'es': 'Mantente alerta con tu cita',
      'en': '',
    },
    'hjb5spz6': {
      'es': 'Visualiza el tiempo faltante para tu cita',
      'en': '',
    },
    '7yfvpemc': {
      'es': 'Home',
      'en': '',
    },
  },
  // profile
  {
    'j5i2dixb': {
      'es': 'Amado',
      'en': '',
    },
    'loi7zyyz': {
      'es': 'Editar Perfil',
      'en': '',
    },
    'o4hdgnz4': {
      'es': 'Name',
      'en': '',
    },
    'ovwb4fka': {
      'es': 'Amado',
      'en': '',
    },
    'm6fyidcv': {
      'es': 'Email',
      'en': '',
    },
    '84jwcba1': {
      'es': 'amado@example.com',
      'en': '',
    },
    '9xsbil6s': {
      'es': 'Descripcion',
      'en': '',
    },
    'odkb50m4': {
      'es':
          'Me gusta mantenerme al dia, por eso es necesario gestionar mis eventos',
      'en': '',
    },
    'r0qrw5uu': {
      'es': 'Zona horaria',
      'en': '',
    },
    'vwky96gf': {
      'es': 'UTC+05:00 - (Costa rica, Mexico)\'',
      'en': '',
    },
    'ix9f8389': {
      'es': 'Formato de hora',
      'en': '',
    },
    'wd7ltwkp': {
      'es': '12H - (05:00 PM)',
      'en': '',
    },
    'esztcb1z': {
      'es': 'Home',
      'en': '',
    },
  },
  // editProfile
  {
    'esewjo7e': {
      'es': 'Amado',
      'en': '',
    },
    'bslf03b9': {
      'es': 'Guardar',
      'en': '',
    },
    'ggqy9u6b': {
      'es': 'Nombre',
      'en': '',
    },
    '9jhcgpte': {
      'es': 'Correo',
      'en': '',
    },
    'i7rvl0tw': {
      'es': 'Descripcion',
      'en': '',
    },
    '5acuyc4y': {
      'es': 'Zona horaria',
      'en': '',
    },
    'ieikahdt': {
      'es': 'Option 1',
      'en': '',
    },
    '7hjkcryk': {
      'es': 'Search for an item...',
      'en': '',
    },
    'lcnim8di': {
      'es': 'Formato de hora',
      'en': '',
    },
    'wd52fzzw': {
      'es': '12H - (05:00 PM)',
      'en': '',
    },
    'psim6be8': {
      'es': '24H - (1700 HRS)',
      'en': '',
    },
    'pyzvfz5l': {
      'es': 'Search for an item...',
      'en': '',
    },
    'j9lr5xcr': {
      'es': 'Home',
      'en': '',
    },
  },
  // calendarSync
  {
    '7e1ucy7k': {
      'es': 'User',
      'en': '',
    },
    '1jtey47z': {
      'es': 'Agregar Calendario',
      'en': '',
    },
    '1f5ppwar': {
      'es': 'Cuenta de calendario',
      'en': '',
    },
    '5lynbnss': {
      'es': 'Google',
      'en': '',
    },
    'ox8fqd9m': {
      'es': 'amado@example.com',
      'en': '',
    },
    'ww8h3kfh': {
      'es': 'Home',
      'en': '',
    },
  },
  // addCalendar
  {
    'y0wfkilp': {
      'es': 'Amado',
      'en': '',
    },
    'x910jxs6': {
      'es': 'Agregar Calendario',
      'en': '',
    },
    'jwhuvvd8': {
      'es': 'Mi calendario',
      'en': '',
    },
    '6e78oksk': {
      'es': 'Agregar',
      'en': '',
    },
    '9cjiu463': {
      'es': 'Calendario no disponible',
      'en': '',
    },
    '8euipjxg': {
      'es': 'Home',
      'en': '',
    },
  },
  // scheduledEvents
  {
    'qn8safv6': {
      'es': 'Amado',
      'en': '',
    },
    '6qa5b58o': {
      'es': 'Eventos programados',
      'en': '',
    },
    'f5hx8zn2': {
      'es': 'U',
      'en': '',
    },
    '7yxv9mmc': {
      'es': 'Amado',
      'en': '',
    },
    'h7s05wj6': {
      'es': 'amado@example.com',
      'en': '',
    },
    'oa37qumd': {
      'es': 'Evento del dia',
      'en': '',
    },
    'mi6ul4hw': {
      'es': '08:00 am',
      'en': '',
    },
    '321t40li': {
      'es': 'Cita de trabajo',
      'en': '',
    },
    'mokrjc39': {
      'es': '2hrs ',
      'en': '',
    },
    'rwyuc97g': {
      'es': '11:30 am',
      'en': '',
    },
    '5qpyz850': {
      'es': 'Reunion ejecutiva',
      'en': '',
    },
    'coex9d17': {
      'es': '1hr',
      'en': '',
    },
    'f2xuf3fi': {
      'es': '12:00 pm',
      'en': '',
    },
    'mk890dcq': {
      'es': 'interview',
      'en': '',
    },
    'xy3xacxy': {
      'es': 'with Richard Hendricks',
      'en': '',
    },
    '7w77wnkx': {
      'es': 'Home',
      'en': '',
    },
  },
  // editSingleSession
  {
    'pphnrn5o': {
      'es': 'Amado',
      'en': '',
    },
    'uyusotp9': {
      'es': 'Atras',
      'en': '',
    },
    'zhmqr4tg': {
      'es': 'Eventos',
      'en': '',
    },
    'uktcyzlo': {
      'es': 'U',
      'en': '',
    },
    'jqy0k99i': {
      'es': 'Amado',
      'en': '',
    },
    'u0kqzmqo': {
      'es': 'amado@example.com',
      'en': '',
    },
    'k0wsy6c7': {
      'es': 'CREAR EVENTO',
      'en': '',
    },
    '49spwkmu': {
      'es': 'Nombre del evento',
      'en': '',
    },
    't6ccvstp': {
      'es': 'Descripcion del evento',
      'en': '',
    },
    'kwf3jui5': {
      'es': '',
      'en': '',
    },
    '5okwdvki': {
      'es': 'Seleccionar fechas',
      'en': '',
    },
    'eoslfx5i': {
      'es': 'Fecha de inicio',
      'en': '',
    },
    'oa1hmmuc': {
      'es': 'Fecha final',
      'en': '',
    },
    '1fxbt96d': {
      'es': 'Duracion del evento',
      'en': '',
    },
    'figeq4cx': {
      'es': ' *',
      'en': '',
    },
    'vihwbyac': {
      'es': 'Hora de inicio',
      'en': '',
    },
    'ag6s9zy2': {
      'es': 'null',
      'en': '',
    },
    'w1cj9ej6': {
      'es': 'Option 1',
      'en': '',
    },
    'x815j255': {
      'es': 'Search for an item...',
      'en': '',
    },
    'q8adypho': {
      'es': 'Hora final',
      'en': '',
    },
    '06vpwadj': {
      'es': 'null',
      'en': '',
    },
    'i9itf8xn': {
      'es': 'Option 1',
      'en': '',
    },
    '1rkv5v8r': {
      'es': 'Search for an item...',
      'en': '',
    },
    'tbng3yyo': {
      'es': 'Todo el dia',
      'en': '',
    },
    '6eyfuoxo': {
      'es': 'Crear',
      'en': '',
    },
    'ci8ufxl4': {
      'es': 'Cancelar',
      'en': '',
    },
    '8ythtams': {
      'es': 'Home',
      'en': '',
    },
  },
  // loginEmail
  {
    'zs791boe': {
      'es': 'Aplicacion para crear eventos',
      'en': '',
    },
    '7x1l6g37': {
      'es': 'Creacion de eventos',
      'en': '',
    },
    'uo7g6h1l': {
      'es': ' Ideal para recordar tus fechas y eventos mas importantes',
      'en': '',
    },
    'bwvcw8yj': {
      'es': 'Correo',
      'en': '',
    },
    'e5tpm61b': {
      'es': 'Contraseña',
      'en': '',
    },
    'fjbkojgi': {
      'es': 'Iniciar',
      'en': '',
    },
    'fj5vvn1u': {
      'es': 'Home',
      'en': '',
    },
  },
  // Aniversario
  {
    'ddwtm6tn': {
      'es': 'Amado',
      'en': '',
    },
    'arxsag76': {
      'es': 'Atras',
      'en': '',
    },
    'bkcy88xo': {
      'es': 'Eventos',
      'en': '',
    },
    'cdk9588x': {
      'es': 'U',
      'en': '',
    },
    'xc37e6pn': {
      'es': 'Amado',
      'en': '',
    },
    'hbjwi0f9': {
      'es': 'amado@example.com',
      'en': '',
    },
    'el9n3kmx': {
      'es': 'CREAR ANIVERSARIO',
      'en': '',
    },
    'agw06ti3': {
      'es': 'Nombre del aniversario',
      'en': '',
    },
    'xm1g5hq3': {
      'es': 'Descripcion del aniversario',
      'en': '',
    },
    'wltn8f0f': {
      'es': '',
      'en': '',
    },
    'wwbnhjo9': {
      'es': 'Seleccionar fecha',
      'en': '',
    },
    'i7wsr1bp': {
      'es': 'Duracion del evento',
      'en': '',
    },
    'wiqrpkjy': {
      'es': ' *',
      'en': '',
    },
    '8i0admhu': {
      'es': 'Todo el dia',
      'en': '',
    },
    'n0tgpqx9': {
      'es': 'Crear',
      'en': '',
    },
    'pnri5ua9': {
      'es': 'Cancelar',
      'en': '',
    },
    'burm8eww': {
      'es': 'Home',
      'en': '',
    },
  },
  // Cuentaregresiva
  {
    'letc05zs': {
      'es': 'Amado',
      'en': '',
    },
    'faiqt3nl': {
      'es': 'Atras',
      'en': '',
    },
    '2p79ehrk': {
      'es': 'Eventos',
      'en': '',
    },
    'wf20qzik': {
      'es': 'U',
      'en': '',
    },
    'umkr4hut': {
      'es': 'Amado',
      'en': '',
    },
    'g5pojr7q': {
      'es': 'amado@example.com',
      'en': '',
    },
    '7nx48bkl': {
      'es': 'CREAR EVENTO',
      'en': '',
    },
    '9qpzbwwi': {
      'es': 'Nombre del evento',
      'en': '',
    },
    'zxxcz4y0': {
      'es': 'Descripcion del evento',
      'en': '',
    },
    'rqwnxsk9': {
      'es': '',
      'en': '',
    },
    'hyph7y9u': {
      'es': 'Seleccionar fecha',
      'en': '',
    },
    'xyefuypa': {
      'es': 'Fecha destino',
      'en': '',
    },
    '3kpfcuw3': {
      'es': 'Crear',
      'en': '',
    },
    '7pbktl5y': {
      'es': 'Cancelar',
      'en': '',
    },
    'b2xfslmd': {
      'es': 'Home',
      'en': '',
    },
  },
  // rightSheet
  {
    '0rzt0up3': {
      'es': 'Configuracion',
      'en': '',
    },
    '06mk999u': {
      'es': 'Perfil',
      'en': '',
    },
    '3bxytkfp': {
      'es': 'Agregar Calendario',
      'en': '',
    },
    'hp3fa8yd': {
      'es': 'Salir',
      'en': '',
    },
  },
  // leftSheet
  {
    'roqsy5ke': {
      'es': 'Crear Evento',
      'en': '',
    },
    'dhr4ivhv': {
      'es': 'Eventos',
      'en': '',
    },
    '1h6gj04f': {
      'es': 'Eventos Programados',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'zkw2rr7t': {
      'es': '',
      'en': '',
    },
    'vv9eu1c3': {
      'es': '',
      'en': '',
    },
    'l7vgf2uy': {
      'es': '',
      'en': '',
    },
    '1q6owuxe': {
      'es': '',
      'en': '',
    },
    'e8tq9lej': {
      'es': '',
      'en': '',
    },
    'aqstcrw8': {
      'es': '',
      'en': '',
    },
    'ombq0p2u': {
      'es': '',
      'en': '',
    },
    'shjg5v2e': {
      'es': '',
      'en': '',
    },
    '4659339h': {
      'es': '',
      'en': '',
    },
    '29gg16mm': {
      'es': '',
      'en': '',
    },
    'vhatayrr': {
      'es': '',
      'en': '',
    },
    'cnxixux4': {
      'es': '',
      'en': '',
    },
    'p8bi2nun': {
      'es': '',
      'en': '',
    },
    '0fe6lp1k': {
      'es': '',
      'en': '',
    },
    'y9ln73lo': {
      'es': '',
      'en': '',
    },
    '34imx8rn': {
      'es': '',
      'en': '',
    },
    '0q2zv57g': {
      'es': '',
      'en': '',
    },
    'w22kmx2v': {
      'es': '',
      'en': '',
    },
    'fn78m31z': {
      'es': '',
      'en': '',
    },
    'b02jj459': {
      'es': '',
      'en': '',
    },
    'cznn53kf': {
      'es': '',
      'en': '',
    },
    'a8hj7sxf': {
      'es': '',
      'en': '',
    },
    'g08nxxmy': {
      'es': '',
      'en': '',
    },
    'nz7f7d11': {
      'es': '',
      'en': '',
    },
    'fkvpcvdq': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
