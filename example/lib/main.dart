import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flow_builder/flow_builder.dart';


void main() {
  runApp(MyApp());
}

/// EXAMPLE
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          FlowStateBuilder<SampleFlowState>.sequence(
            flows: [future1, future2, future3],
            flowWidgetBuilder: (_, state) {
              Color color = Colors.white;
              if (state?.sampleEnum == SampleEnum.state_1) {
                color = Colors.red;
              } else if (state?.sampleEnum == SampleEnum.state_2) {
                color = Colors.blue;
              } else if (state?.sampleEnum == SampleEnum.state_3) {
                color = Colors.yellow;
              }
              return Container(
                height: 200,
                width: double.infinity,
                color: color,
              );
            },
          ),
          Padding(padding: EdgeInsets.all(20)),
          FlowStateBuilder<SampleFlowState>(
            flows: [future1, future2, future3],
            flowWidgetBuilder: (_, state) {
              Color color = Colors.white;
              if (state?.sampleEnum == SampleEnum.state_1) {
                color = Colors.red;
              } else if (state?.sampleEnum == SampleEnum.state_2) {
                color = Colors.blue;
              } else if (state?.sampleEnum == SampleEnum.state_3) {
                color = Colors.yellow;
              }
              return Container(
                height: 200,
                width: double.infinity,
                color: color,
              );
            },
          )
        ],
      ),
    );
  }

  FutureFunction<SampleFlowState> future1 = () async {
    await Future.delayed(Duration(milliseconds: 2000));
    return Future.value(SampleFlowState.a());
  };

  FutureFunction<SampleFlowState> future2 = () async {
    await Future.delayed(Duration(milliseconds: 1500));
    return Future.value(SampleFlowState.b());
  };

  FutureFunction<SampleFlowState> future3 = () async {
    await Future.delayed(Duration(milliseconds: 3500));
    return Future.value(SampleFlowState.c());
  };
}

class SampleFlowState extends FlowState {
  SampleEnum sampleEnum;

  SampleFlowState(this.sampleEnum);

  SampleFlowState.a() : this(SampleEnum.state_1);
  SampleFlowState.b() : this(SampleEnum.state_2);
  SampleFlowState.c() : this(SampleEnum.state_3);
}

enum SampleEnum {
  state_1,
  state_2,
  state_3,
}