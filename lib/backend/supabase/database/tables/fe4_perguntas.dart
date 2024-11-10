import '../database.dart';

class Fe4PerguntasTable extends SupabaseTable<Fe4PerguntasRow> {
  @override
  String get tableName => 'fe4_perguntas';

  @override
  Fe4PerguntasRow createRow(Map<String, dynamic> data) => Fe4PerguntasRow(data);
}

class Fe4PerguntasRow extends SupabaseDataRow {
  Fe4PerguntasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => Fe4PerguntasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get cNcategoria => getField<int>('c_ncategoria');
  set cNcategoria(int? value) => setField<int>('c_ncategoria', value);

  int? get npergunta => getField<int>('npergunta');
  set npergunta(int? value) => setField<int>('npergunta', value);

  String? get pergunta => getField<String>('pergunta');
  set pergunta(String? value) => setField<String>('pergunta', value);
}
