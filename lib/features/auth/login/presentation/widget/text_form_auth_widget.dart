import 'package:flutter/material.dart';
import 'package:posts_app_clean_architecture/app/constant/colors.dart';

class TextFormAuthWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController? myController;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const TextFormAuthWidget(
      {Key? key,
      this.obscureText,
      this.onTapIcon,
      required this.hintText,
      required this.labelText,
      required this.iconData,
      required this.myController,
      required this.valid,
      required this.isNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: myController,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
            errorStyle: const TextStyle(
              color: Colors.red,
            ),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.red,
            )),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(
                  labelText,
                  style: TextStyle(color: Theme.of(context).hintColor,),
                )),
            suffixIcon: InkWell(child: Icon(iconData,color: AppColor.black), onTap: onTapIcon),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
