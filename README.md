# flow_builder

通过Stream实现异步数据流监听的组件构造器。

1.实现FlowState抽象类来自定义数据流状态；

2.flows：返回对应State的异步任务；

3.flowWidgetBuilder构建对应state不同组件；

```

      FlowStateBuilder<CustomState>(
        flows: [future1, future2, future3],
        flowWidgetBuilder: (_, state) {
          return Container(child: ...);
        },
      )
```

