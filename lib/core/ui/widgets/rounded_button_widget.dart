import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color? color;
  final Color? textColor;
  final Widget? child;
  const RoundedButtonWidget(
      {Key? key,
      required this.text,
      required this.press,
      this.color,
      this.textColor = Colors.white,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) {
                if (states.contains(MaterialState.disabled)) {
                  return Theme.of(context).primaryColor.withAlpha(100);
                }
                return color!;
              },
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: press,
          child: child!,
        ),
      ),
    );
  }
}
