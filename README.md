# flutter_widget_lifecycle ![Build](https://github.com/tbm98/flutter_widget_lifecycle/workflows/Build/badge.svg)

A new Flutter package can detect when the widget appears or not.

## Getting Started
```dart
LifeCycleWidget(
      onAppear: () {
        print('tab1 onAppear');
      },
      onDisappear: () {
        print('tab1 onDisappear');
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('tab1'),
            ],
          ),
        )),
      ),
    )
```
