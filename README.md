# flutter_widget_lifecycle

A new Flutter package can detect when widget is appear or not.

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