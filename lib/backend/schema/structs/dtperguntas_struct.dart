// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtperguntasStruct extends BaseStruct {
  DtperguntasStruct({
    int? cNcategoria,
    int? npergunta,
    String? pergunta,
    int? opcaoescolhida,
    bool? estacorreto,
  })  : _cNcategoria = cNcategoria,
        _npergunta = npergunta,
        _pergunta = pergunta,
        _opcaoescolhida = opcaoescolhida,
        _estacorreto = estacorreto;

  // "c_ncategoria" field.
  int? _cNcategoria;
  int get cNcategoria => _cNcategoria ?? 0;
  set cNcategoria(int? val) => _cNcategoria = val;

  void incrementCNcategoria(int amount) => cNcategoria = cNcategoria + amount;

  bool hasCNcategoria() => _cNcategoria != null;

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

  // "opcaoescolhida" field.
  int? _opcaoescolhida;
  int get opcaoescolhida => _opcaoescolhida ?? 0;
  set opcaoescolhida(int? val) => _opcaoescolhida = val;

  void incrementOpcaoescolhida(int amount) =>
      opcaoescolhida = opcaoescolhida + amount;

  bool hasOpcaoescolhida() => _opcaoescolhida != null;

  // "estacorreto" field.
  bool? _estacorreto;
  bool get estacorreto => _estacorreto ?? false;
  set estacorreto(bool? val) => _estacorreto = val;

  bool hasEstacorreto() => _estacorreto != null;

  static DtperguntasStruct fromMap(Map<String, dynamic> data) =>
      DtperguntasStruct(
        cNcategoria: castToType<int>(data['c_ncategoria']),
        npergunta: castToType<int>(data['npergunta']),
        pergunta: data['pergunta'] as String?,
        opcaoescolhida: castToType<int>(data['opcaoescolhida']),
        estacorreto: data['estacorreto'] as bool?,
      );

  static DtperguntasStruct? maybeFromMap(dynamic data) => data is Map
      ? DtperguntasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'c_ncategoria': _cNcategoria,
        'npergunta': _npergunta,
        'pergunta': _pergunta,
        'opcaoescolhida': _opcaoescolhida,
        'estacorreto': _estacorreto,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'c_ncategoria': serializeParam(
          _cNcategoria,
          ParamType.int,
        ),
        'npergunta': serializeParam(
          _npergunta,
          ParamType.int,
        ),
        'pergunta': serializeParam(
          _pergunta,
          ParamType.String,
        ),
        'opcaoescolhida': serializeParam(
          _opcaoescolhida,
          ParamType.int,
        ),
        'estacorreto': serializeParam(
          _estacorreto,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DtperguntasStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtperguntasStruct(
        cNcategoria: deserializeParam(
          data['c_ncategoria'],
          ParamType.int,
          false,
        ),
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
        opcaoescolhida: deserializeParam(
          data['opcaoescolhida'],
          ParamType.int,
          false,
        ),
        estacorreto: deserializeParam(
          data['estacorreto'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DtperguntasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtperguntasStruct &&
        cNcategoria == other.cNcategoria &&
        npergunta == other.npergunta &&
        pergunta == other.pergunta &&
        opcaoescolhida == other.opcaoescolhida &&
        estacorreto == other.estacorreto;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([cNcategoria, npergunta, pergunta, opcaoescolhida, estacorreto]);
}

DtperguntasStruct createDtperguntasStruct({
  int? cNcategoria,
  int? npergunta,
  String? pergunta,
  int? opcaoescolhida,
  bool? estacorreto,
}) =>
    DtperguntasStruct(
      cNcategoria: cNcategoria,
      npergunta: npergunta,
      pergunta: pergunta,
      opcaoescolhida: opcaoescolhida,
      estacorreto: estacorreto,
    );
