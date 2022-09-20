// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appdata.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppData on _AppData, Store {
  late final _$dataAtom = Atom(name: '_AppData.data', context: context);

  @override
  dynamic get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(dynamic value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$clanDataAtom = Atom(name: '_AppData.clanData', context: context);

  @override
  dynamic get clanData {
    _$clanDataAtom.reportRead();
    return super.clanData;
  }

  @override
  set clanData(dynamic value) {
    _$clanDataAtom.reportWrite(value, super.clanData, () {
      super.clanData = value;
    });
  }

  @override
  String toString() {
    return '''
data: ${data},
clanData: ${clanData}
    ''';
  }
}
