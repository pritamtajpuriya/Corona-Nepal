class Language {
  final int id;
  final String flag;
  final String languageCode;
  final String name;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, '🇺🇸', 'English', 'en'),
      Language(2, '🇳🇵', 'नेपाली', 'ne')
    ];
  }
}
