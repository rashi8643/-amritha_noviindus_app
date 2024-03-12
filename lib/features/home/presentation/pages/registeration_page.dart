import 'package:flutter/material.dart';
import 'package:novi_indus_test/core/widgets/sub_title_widgets.dart';

class RegisterationPage extends StatelessWidget {
  const RegisterationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [SubTitleWidget(title: '')],
        ),
      ),
    );
  }
}
