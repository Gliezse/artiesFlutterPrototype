import 'package:arties_flutter_prototype/views/home/model/home_page_model.dart';
import 'package:arties_flutter_prototype/views/home/widgets/login_page.dart';
import 'package:arties_flutter_prototype/views/home/widgets/register_page.dart';
import 'package:arties_flutter_prototype/views/scoped_base_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {

  static final String route = "/home";

  @override
  Widget build(BuildContext context) {
    return BaseView<HomePageModel>(
      builder: (context, child, model) => Scaffold(
        body: PageView(
          scrollDirection: Axis.vertical,
          children: [
            LoginSection(model: model),
            RegisterSection(model: model),
          ],
        ),
      ),
    );
  }
}
