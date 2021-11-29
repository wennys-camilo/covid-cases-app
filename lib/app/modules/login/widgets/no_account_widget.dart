import 'package:flutter/material.dart';

class NoAcconuntWidget extends StatelessWidget {
  final void Function()? press;

  const NoAcconuntWidget({Key? key, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Não possui uma conta ? ",
          style: TextStyle(color: Color(0xff2e2e42)),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "Cadastre-se",
            style: TextStyle(
              color: Color(0xff2e2e42),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
