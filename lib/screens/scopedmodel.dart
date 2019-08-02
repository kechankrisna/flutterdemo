import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scoped_model/scoped_model.dart';
import './drawer.dart';


// 1- Create a class model by extends Model eg. CounterModel
// 2- At parent widget: use ScopedModel<model name> to passed model from parent to child eg. ScopedModel<CounterModel>()
// 3- At child widget: use ScopedModelDescendant<model name> to get model access from parent

//global shareable object
class CounterModel extends Model {
  int _counter = 0;
  int get counter => this._counter;

  //function
  void increment({int n}) {
    if (n != null) {
      _counter += n;
    } else {
      _counter++;
    }

    // Then notify all the listeners.
    notifyListeners();
  }

  void decrement({int n}) {
    if (n != null) {
      _counter -= n;
    } else {
      _counter--;
    }

    notifyListeners();
  }
}



class ScopedModelScreen extends StatefulWidget {
  @override
  _ScopedModelScreenState createState() => _ScopedModelScreenState();
}

class _ScopedModelScreenState extends State<ScopedModelScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Scoped Model"),
        ),
        drawer: StyleDrawer(),
        body: Container(
          child: ScopedModelDescendant<CounterModel>(
            builder: (context, child, model) {
              return Center(child: Text(model.counter.toString()));
            },
          ),
        ),
        floatingActionButton: ScopedModelDescendant(
          builder: (BuildContext context, Widget child, CounterModel model) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    model.decrement(n: 5);
                  },
                  tooltip: "-1",
                  child: Icon(Icons.remove),
                ),
                // FloatingActionButton(
                //   onPressed: () {
                //     model.increment(n: 5);
                //   },
                //   tooltip: "-1",
                //   child: Icon(Icons.add),
                // )
              ],
            );
          },
        ),
      ),
    );
  }
}


