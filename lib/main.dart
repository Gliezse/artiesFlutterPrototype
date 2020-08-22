import 'package:arties_flutter_prototype/scoped_model/scoped_model_tree.dart';
import 'package:arties_flutter_prototype/service_locator.dart';
import 'package:arties_flutter_prototype/views/login/login_view.dart';
import 'package:arties_flutter_prototype/views/routes.dart';
import 'package:flutter/material.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelTree(
      scopedModels: getGlobalModels(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Arties Prototype',
        routes: routes,
        initialRoute: LoginView.route,
        theme: ThemeData(
          //scaffoldBackgroundColor: Color.fromRGBO(246, 240, 237, 1)
          scaffoldBackgroundColor: Color.fromRGBO(242, 244, 246, 1),
          fontFamily: "Alata",
          primaryColor: Color.fromRGBO(50, 74, 209, 1)
        ),
      ),
    );
  }
}