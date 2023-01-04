import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final Function? onLongPressed;
  final String? text;
  final Color color;
  final bool isFilled;
  final IconData? icon;
  final double sizeIcon;
  final double sizeFont;
  final double? padding;

  const CustomIconButton({
    Key? key,
    required this.onPressed,
    this.onLongPressed,
    this.text,
    this.sizeIcon = 40,
    this.sizeFont = 20,
    this.icon,
    this.color = Colors.white,
    this.isFilled = true,
    this.padding = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.amber.shade50),
            elevation: MaterialStateProperty.all<double>(10),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.all(padding!)),
            // shape: MaterialStateProperty.all(StadiumBorder()),
            backgroundColor: MaterialStateProperty.all(
              color,
            )),
        onPressed: () => onPressed(),
        onLongPress: () => onLongPressed!(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              LinearGradientMask(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: sizeIcon,
                ),
              ),
            if (icon != null)
              SizedBox(
                width: 10,
              ),
            if (text != null)
              Text(
                text!,
                style: TextStyle(
                    color: Colors.blueGrey.shade900, fontSize: sizeFont / 1.25),
              )
          ],
        ));
  }
}

class LinearGradientMask extends StatelessWidget {
  final Widget? child;
  LinearGradientMask({this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return RadialGradient(
          center: Alignment.topRight,
          radius: 2,
          colors: [
            Colors.red,
            Colors.blue,
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
