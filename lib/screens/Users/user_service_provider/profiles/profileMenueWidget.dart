import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileManuewidget extends StatelessWidget {
  const ProfileManuewidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onpress,
    this.endicon= true,
    this.textcolor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onpress;
  final bool endicon;
  final Color? textcolor;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpress,
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: CupertinoColors.activeBlue.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Icon(FontAwesomeIcons.user, color: CupertinoColors.activeBlue.withOpacity(0.1),),
      ),
      title: Text(title, style: TextStyle(color: textcolor,fontSize: 20, fontWeight: FontWeight.bold),),
      trailing: endicon? Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: CupertinoColors.activeBlue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Icon(FontAwesomeIcons.angleRight, color: CupertinoColors.darkBackgroundGray,),
      ): null,
    );
  }
}