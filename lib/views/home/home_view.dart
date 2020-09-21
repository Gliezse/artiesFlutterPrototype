import 'package:arties_flutter_prototype/views/home/model/home_view_model.dart';
import 'package:arties_flutter_prototype/views/home/widgets/profile_section.dart';
import 'package:arties_flutter_prototype/views/scoped_base_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {

  static final String route = "/home";

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, child, model) => Scaffold(
        appBar: buildAppBar(context),
        body: buildDesktop(),
      ),
    );
  }

  Container buildDesktop() {
    return Container(
        child: Center(
          child: Text(
            "Desktop"
          ),
        ),
      );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Titulo",
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: (){},
      ),
    );
  }
}