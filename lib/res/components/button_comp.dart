import 'package:flutter/material.dart';
import '../../utils/app_color.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    Key? key,
    required this.title,
    required this.isLoading,
    this.ontap,
    this.style = const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: kWhite),
  }) : super(key: key);
  final String title;
  final VoidCallback? ontap;
  final TextStyle style;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        color: kPrimary,
        onPressed: ontap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: !isLoading
              ? Text(
                  title,
                  style: style,
                )
              : const CircularProgressIndicator(
                  color: kWhite,
                ),
        ),
      ),
    );
  }
}
