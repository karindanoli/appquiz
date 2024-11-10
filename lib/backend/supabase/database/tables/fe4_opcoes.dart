import '../database.dart';

class Fe4OpcoesTable extends SupabaseTable<Fe4OpcoesRow> {
  @override
  String get tableName => 'fe4_opcoes';

  @override
  Fe4OpcoesRow createRow(Map<String, dynamic> data) => Fe4OpcoesRow(data);
}

class Fe4OpcoesRow extends SupabaseDataRow {
  Fe4OpcoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => Fe4OpcoesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get cNpergunta => getField<int>('c_npergunta');
  set cNpergunta(int? value) => setField<int>('c_npergunta', value);

  int? get nopcao => getField<int>('nopcao');
  set nopcao(int? value) => setField<int>('nopcao', value);

  String? get opcao => getField<String>('opcao');
  set opcao(String? value) => setField<String>('opcao', value);

  bool? get estacorreto => getField<bool>('estacorreto');
  set estacorreto(bool? value) => setField<bool>('estacorreto', value);
}
