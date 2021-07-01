# flow_builder

通过Stream实现异步数据流监听的组件构造器。

```

      FlowStateBuilder<CustomState>(
        flows: [future1, future2, future3],
        flowWidgetBuilder: (_, state) {
          return Container(child: ...);
        },
      )
```

