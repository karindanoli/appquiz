import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'perguntas_model.dart';
export 'perguntas_model.dart';

class PerguntasWidget extends StatefulWidget {
  const PerguntasWidget({
    super.key,
    required this.ncategoria,
    required this.categoria,
  });

  final int? ncategoria;
  final String? categoria;

  @override
  State<PerguntasWidget> createState() => _PerguntasWidgetState();
}

class _PerguntasWidgetState extends State<PerguntasWidget> {
  late PerguntasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerguntasModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.outPerguntas = await BuscarPerguntasCall.call(
        categoria: 'eq.${valueOrDefault<String>(
          widget!.ncategoria?.toString(),
          '1',
        )}',
      );

      _model.outOpcoes = await BuscarOpcoesCall.call(
        categoria: 'eq.${valueOrDefault<String>(
          widget!.ncategoria?.toString(),
          '0',
        )}',
      );

      // Atualiza lista perguntas
      _model.listaPerguntas = ((_model.outPerguntas?.jsonBody ?? '')
              .toList()
              .map<DtperguntasStruct?>(DtperguntasStruct.maybeFromMap)
              .toList() as Iterable<DtperguntasStruct?>)
          .withoutNulls
          .toList()
          .cast<DtperguntasStruct>();
      _model.indiceAtual = 0;
      _model.perguntaAtual = _model.listaPerguntas[_model.indiceAtual!];
      _model.listaopcoes = ((_model.outOpcoes?.jsonBody ?? '')
              .toList()
              .map<DtopcoesStruct?>(DtopcoesStruct.maybeFromMap)
              .toList() as Iterable<DtopcoesStruct?>)
          .withoutNulls
          .toList()
          .cast<DtopcoesStruct>();
      _model.totalPerguntas = valueOrDefault<int>(
        _model.listaPerguntas.length,
        0,
      );
      safeSetState(() {});
      FFAppState().quizConcluido = false;
      safeSetState(() {});
      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 500.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 36.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.categoria,
                                  'Categoria...',
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            'Pergunta  ${((_model.indiceAtual!) + 1).toString()}/${valueOrDefault<String>(
                              _model.totalPerguntas?.toString(),
                              '0',
                            )}',
                            'Carregando total...',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Icon(
                          Icons.timer_sharp,
                          color: FlutterFlowTheme.of(context).error,
                          size: 24.0,
                        ),
                        FlutterFlowTimer(
                          initialTime: _model.timerInitialTimeMs,
                          getDisplayTime: (value) =>
                              StopWatchTimer.getDisplayTime(
                            value,
                            hours: false,
                            minute: false,
                            milliSecond: false,
                          ),
                          controller: _model.timerController,
                          updateStateInterval: Duration(milliseconds: 20000),
                          onChanged: (value, displayTime, shouldUpdate) {
                            _model.timerMilliseconds = value;
                            _model.timerValue = displayTime;
                            if (shouldUpdate) safeSetState(() {});
                          },
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 118.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              valueOrDefault<String>(
                                _model.perguntaAtual?.pergunta,
                                '...',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final itemOpcao = _model.listaopcoes
                            .where((e) =>
                                e.npergunta ==
                                valueOrDefault<int>(
                                  _model.perguntaAtual?.npergunta,
                                  0,
                                ))
                            .toList();

                        return ListView.separated(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            10.0,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: itemOpcao.length,
                          separatorBuilder: (_, __) => SizedBox(height: 12.0),
                          itemBuilder: (context, itemOpcaoIndex) {
                            final itemOpcaoItem = itemOpcao[itemOpcaoIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.updateListaPerguntasAtIndex(
                                  _model.indiceAtual!,
                                  (e) => e
                                    ..opcaoescolhida = itemOpcaoItem.nopcao
                                    ..estacorreto = itemOpcaoItem.estacorreto,
                                );
                                safeSetState(() {});
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  width: 100.0,
                                  height: 65.0,
                                  decoration: BoxDecoration(
                                    color: itemOpcaoItem.nopcao ==
                                            valueOrDefault<int>(
                                              _model
                                                  .listaPerguntas[
                                                      _model.indiceAtual!]
                                                  .opcaoescolhida,
                                              0,
                                            )
                                        ? FlutterFlowTheme.of(context)
                                            .selecionado
                                        : FlutterFlowTheme.of(context).accent4,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    _model
                                                        .letras[itemOpcaoIndex],
                                                    '...',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 100.0,
                                          child: VerticalDivider(
                                            thickness: 2.0,
                                            indent: 8.0,
                                            endIndent: 8.0,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            valueOrDefault<String>(
                                              itemOpcaoItem.opcao,
                                              '...',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        if (FFAppState().quizConcluido)
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (itemOpcaoItem.estacorreto)
                                                Icon(
                                                  Icons
                                                      .check_circle_outline_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 24.0,
                                                ),
                                              if (itemOpcaoItem.estacorreto ==
                                                  false)
                                                Icon(
                                                  Icons.close_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 24.0,
                                                ),
                                            ],
                                          ),
                                      ].divide(SizedBox(width: 4.0)),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FFButtonWidget(
                            onPressed: (_model.indiceAtual == 0)
                                ? null
                                : () async {
                                    _model.indiceAtual =
                                        _model.indiceAtual! + -1;
                                    _model.perguntaAtual = _model
                                        .listaPerguntas[_model.indiceAtual!];
                                    safeSetState(() {});
                                  },
                            text: 'Anterior',
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              disabledTextColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              if (_model.listaPerguntas[_model.indiceAtual!]
                                      .opcaoescolhida >
                                  0) {
                                if (_model.totalPerguntas ==
                                    ((_model.indiceAtual!) + 1)) {
                                  context.pushNamed(
                                    'conclusao',
                                    queryParameters: {
                                      'respostas': serializeParam(
                                        [],
                                        ParamType.bool,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  // avançar pergunta
                                  _model.indiceAtual = _model.indiceAtual! + 1;
                                  _model.perguntaAtual = _model
                                      .listaPerguntas[_model.indiceAtual!];
                                  safeSetState(() {});
                                  _model.timerController.onResetTimer();

                                  _model.timerController.onStartTimer();
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Atenção'),
                                      content: Text('Escolha uma opção!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            text: _model.totalPerguntas ==
                                    ((_model.indiceAtual!) + 1)
                                ? 'Concluir'
                                : 'Próximo',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).selecionado,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
