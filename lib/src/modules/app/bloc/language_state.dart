part of 'language_bloc.dart';

class LanguageState extends Equatable {
  const LanguageState({required this.localeCodeProvider});
  final String localeCodeProvider;
  LanguageState copyWith({String? localeCodeProvider}) {
    return LanguageState(
        localeCodeProvider: localeCodeProvider ?? this.localeCodeProvider);
  }

  @override
  List<Object> get props => [localeCodeProvider];
}
