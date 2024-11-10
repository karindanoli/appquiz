// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtopcoesStruct extends BaseStruct {
  DtopcoesStruct({
    int? npergunta,
    String? pergunta,
    int? nopcao,
    String? opcao,
    bool? estacorreto,
  })  : _npergunta = npergunta,
        _pergunta = pergunta,
        _nopcao = nopcao,
        _opcao = opcao,
        _estacorreto = estacorreto;

  // "npergunta" field.
  int? _npergunta;
  int get npergunta => _npergunta ?? 0;
  set npergunta(int? val) => _npergunta = val;

  void incrementNpergunta(int amount) => npergunta = npergunta + amount;

  bool hasNpergunta() => _npergunta != null;

  // "pergunta" field.
  String? _pergunta;
  String get pergunta => _pergunta ?? '';
  set pergunta(String? val) => _pergunta = val;

  bool hasPergunta() => _pergunta != null;

  // "nopcao" field.
  int? _nopcao;
  int get nopcao => _nopcao ?? 0;
  set nopcao(int? val) => _nopcao = val;

  void incrementNopcao(int amount) => nopcao = nopcao + amount;

  bool hasNopcao() => _nopcao != null;

  // "opcao" field.
  String? _opcao;
  String get opcao => _opcao ?? '';
  set opcao(String? val) => _opcao = val;

  bool hasOpcao() => _opcao != null;

  // "estacorreto" field.
  bool? _estacorreto;
  bool get estacorreto => _estacorreto ?? false;
  set estacorreto(bool? val) => _estacorreto = val;

  bool hasEstacorreto() => _estacorreto != null;

  static DtopcoesStruct fromMap(Map<String, dynamic> data) => DtopcoesStruct(
        npergunta: castToType<int>(data['npergunta']),
        pergunta: data['pergunta'] as String?,
        nopcao: castToType<int>(data['nopcao']),
        opcao: data['opcao'] as String?,
        estacorreto: data['estacorreto'] as bool?,
      );

  static DtopcoesStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtopcoesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'npergunta': _npergunta,
        'pergunta': _pergunta,
        'nopcao': _nopcao,
        'opcao': _opcao,
        'estacorreto': _estacorreto,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'npergunta': serializeParam(
          _npergunta,
          ParamType.int,
        ),
        'pergunta': serializeParam(
          _pergunta,
          ParamType.String,
        ),
        'nopcao': serializeParam(
          _nopcao,
          ParamType.int,
        ),
        'opcao': serializeParam(
          _opcao,
          ParamType.String,
        ),
        'estacorreto': serializeParam(
          _estacorreto,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DtopcoesStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtopcoesStruct(
        npergunta: deserializeParam(
          data['npergunta'],
          ParamType.int,
          false,
        ),
        pergunta: deserializeParam(
          data['pergunta'],
          ParamType.String,
          false,
        ),
        nopcao: deserializeParam(
          data['nopcao'],
          ParamType.int,
          false,
        ),
        opcao: deserializeParam(
          data['opcao'],
          ParamType.String,
          false,
        ),
        estacorreto: deserializeParam(
          data['estacorreto'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DtopcoesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtopcoesStruct &&
        npergunta == other.npergunta &&
        pergunta == other.pergunta &&
        nopcao == other.nopcao &&
        opcao == other.opcao &&
        estacorreto == other.estacorreto;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([npergunta, pergunta, nopcao, opcao, estacorreto]);
}

DtopcoesStruct createDtopcoesStruct({
  int? npergunta,
  String? pergunta,
  int? nopcao,
  String? opcao,
  bool? estacorreto,
}) =>
    DtopcoesStruct(
      npergunta: npergunta,
      pergunta: pergunta,
      nopcao: nopcao,
      opcao: opcao,
      estacorreto: estacorreto,
    );
