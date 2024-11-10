import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'perguntas_widget.dart' show PerguntasWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PerguntasModel extends FlutterFlowModel<PerguntasWidget> {
  ///  Local state fields for this page.

  List<DtperguntasStruct> listaPerguntas = [];
  void addToListaPerguntas(DtperguntasStruct item) => listaPerguntas.add(item);
  void removeFromListaPerguntas(DtperguntasStruct item) =>
      listaPerguntas.remove(item);
  void removeAtIndexFromListaPerguntas(int index) =>
      listaPerguntas.removeAt(index);
  void insertAtIndexInListaPerguntas(int index, DtperguntasStruct item) =>
      listaPerguntas.insert(index, item);
  void updateListaPerguntasAtIndex(
          int index, Function(DtperguntasStruct) updateFn) =>
      listaPerguntas[index] = updateFn(listaPerguntas[index]);

  DtperguntasStruct? perguntaAtual;
  void updatePerguntaAtualStruct(Function(DtperguntasStruct) updateFn) {
    updateFn(perguntaAtual ??= DtperguntasStruct());
  }

  int? indiceAtual = 0;

  List<DtopcoesStruct> listaopcoes = [];
  void addToListaopcoes(DtopcoesStruct item) => listaopcoes.add(item);
  void removeFromListaopcoes(DtopcoesStruct item) => listaopcoes.remove(item);
  void removeAtIndexFromListaopcoes(int index) => listaopcoes.removeAt(index);
  void insertAtIndexInListaopcoes(int index, DtopcoesStruct item) =>
      listaopcoes.insert(index, item);
  void updateListaopcoesAtIndex(int index, Function(DtopcoesStruct) updateFn) =>
      listaopcoes[index] = updateFn(listaopcoes[index]);

  List<String> letras = ['A', 'B', 'C', 'D'];
  void addToLetras(String item) => letras.add(item);
  void removeFromLetras(String item) => letras.remove(item);
  void removeAtIndexFromLetras(int index) => letras.removeAt(index);
  void insertAtIndexInLetras(int index, String item) =>
      letras.insert(index, item);
  void updateLetrasAtIndex(int index, Function(String) updateFn) =>
      letras[index] = updateFn(letras[index]);

  int? totalPerguntas;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Buscar Perguntas)] action in Perguntas widget.
  ApiCallResponse? outPerguntas;
  // Stores action output result for [Backend Call - API (Buscar Opcoes)] action in Perguntas widget.
  ApiCallResponse? outOpcoes;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 20000;
  int timerMilliseconds = 20000;
  String timerValue = StopWatchTimer.getDisplayTime(
    20000,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
