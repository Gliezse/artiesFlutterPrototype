import 'package:arties_flutter_prototype/views/login/model/login_page_model.dart';
import 'package:arties_flutter_prototype/views/login/widgets/login_section.dart';
import 'package:arties_flutter_prototype/views/login/widgets/register_section.dart';
import 'package:arties_flutter_prototype/views/scoped_base_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  static final String route = "/login";

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginPageModel>(
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
