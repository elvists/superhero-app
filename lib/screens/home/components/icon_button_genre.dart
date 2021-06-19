import 'package:flutter/material.dart';

class IconButtonGenre extends StatelessWidget {
  const IconButtonGenre({
    Key key,
    @required this.onPressed,
    @required this.icon,
    @required this.color,
    @required this.isSelected,
  }) : super(key: key);

  final void Function() onPressed;
  final IconData icon;
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: new Icon(
          icon,
          color: isSelected ? color : Colors.black12,
        ),
        onPressed: onPressed,
      );
}
