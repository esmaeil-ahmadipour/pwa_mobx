import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pwa_mobx/utils/navigator_service.dart';
import 'package:pwa_mobx/utils/service_locator.dart';
import 'package:pwa_mobx/utils/utility_class.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String strArg='Page 2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (_) => Text(
                '${UtilityClass().getCounter().count}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              ElevatedButton(
                onPressed: () {
                  UtilityClass().getCounter().decrement();
                },
                child: Icon(Icons.remove),
              ),
                ElevatedButton(
                  onPressed: () {
                    locator<NavigationService>().navigateTo('second', args: strArg);
                  },
                  child: Text(strArg.toString()),
                ),
              ElevatedButton(
                onPressed: () {
                  UtilityClass().getCounter().increment();
                },
                child: Icon(Icons.add),
              ),

            ],),
          ],
        ),
      ),
    );
  }
}
