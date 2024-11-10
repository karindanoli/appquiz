import '../database.dart';

class Fe4CategoriasTable extends SupabaseTable<Fe4CategoriasRow> {
  @override
  String get tableName => 'fe4_categorias';

  @override
  Fe4CategoriasRow createRow(Map<String, dynamic> data) =>
      Fe4CategoriasRow(data);
}

class Fe4CategoriasRow extends SupabaseDataRow {
  Fe4CategoriasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => Fe4CategoriasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get ncategoria => getField<int>('ncategoria');
  set ncategoria(int? value) => setField<int>('ncategoria', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);
}
