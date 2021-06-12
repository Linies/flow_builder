import 'package:flutter/widgets.dart';
import 'flow_state.dart';

/// FLOW BUILDER
typedef FlowWidgetBuilder<E extends FlowState> = Widget Function(
    BuildContext context, E state);

typedef FutureFunction<E extends FlowState> = Future<E> Function();

class FlowStateBuilder<E extends FlowState> extends StatelessWidget {

  final Stream<E> _stream;

  final List<FutureFunction<E>> flows;

  final E initialState;

  final FlowWidgetBuilder<E> flowWidgetBuilder;

  FlowStateBuilder({
    @required this.flows,
    @required this.flowWidgetBuilder,
    this.initialState,
  }) : _stream = Stream.fromFutures(flows.map((function) => function.call()));

  FlowStateBuilder.sequence({
    @required this.flows,
    @required this.flowWidgetBuilder,
    this.initialState,
  }) : _stream = Stream.multi(
          (controller) =>
          Future.forEach(flows, (FutureFunction<E> function) async {
            var future = function.call();
            controller.addStream(future.asStream());
            await future;
          }));

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<E>(
      stream: _stream,
      initialData: initialState,
      builder: (_, snapshot) {
        return flowWidgetBuilder(_, snapshot.data);
      },
    );
  }
}