import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/beans/UserRespBean.dart';
import 'Bloc/UserBloc.dart';
import 'Utils/color_loader.dart';
import 'package:flutter_clean_architecture/beans/Quotes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Clean Arch'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    userBloc.getQuotes();
   // userBloc.getUser();
  }

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      body:StreamBuilder<UserResponse>(
      stream: userBloc.subject.stream,
      builder: (context, AsyncSnapshot<UserResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return  new Center(
              child:Text(snapshot.data.error));
          }
          return  new Center(
              child:Text(snapshot.data.toString()));
        } else if (snapshot.hasError) {
          return  new Center(
              child:Text(snapshot.error)
          );
        } else {
          return new Center(child: ColorLoader(
              radius: 15.0,
              dotRadius: 6.0,
            ),);
        }
      },
    ),
    );*/
    return Scaffold(
      body:StreamBuilder<Quotes>(
        stream: userBloc.qotes_observer.stream,
        builder: (context, AsyncSnapshot<Quotes> snapshot) {
          if (snapshot.hasData) {
            return new Center(
                child:Text(snapshot.data.toString())
            );
          } else if (snapshot.hasError) {
            return new Center(
                child: Text(snapshot.error)
            );
          } else {
            return new Center(child: ColorLoader(
              radius: 15.0,
              dotRadius: 6.0,
            ),);
          }
        },
      ),
    );

  }
}
