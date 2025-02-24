import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final String? label;
  final bool obscurePassword;
  final Widget? suffixIcon;
  final double? radius;
  final Color? filledColor;
  final Color? borderColor;
  final bool? readonly;
  final bool? isdense;
  final Function()? onTap;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final TextStyle? hintstyle;
  final TextStyle? labelstyle;
  final int? maxLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final InputBorder? border;
  final InputBorder? focussedborder;
  final bool showhintInlabel;

  final bool isPassword;
  final List<TextInputFormatter>? inputFormatters;

  const TextInputField(
      {super.key,
      this.hintText = '',
      this.obscurePassword = false,
      this.suffixIcon,
      this.radius = 10,
      this.filledColor = const Color(0xffffffff),
      this.borderColor = const Color(0xffffffff),
      this.readonly,
      this.labelstyle,
      this.label,
      this.onTap,
      this.isdense,
      this.onChanged,
      this.prefixIcon,
      this.contentPadding,
      this.validator,
      this.keyboardType,
      this.maxLength,
      this.maxLines,
      this.textStyle,
      this.maxLengthEnforcement,
      this.isPassword = false,
      this.hintstyle,
      this.border,
      this.focussedborder,
      this.inputFormatters,
      this.showhintInlabel = true,
      this.controller});

  @override
  Widget build(BuildContext context) {
    //do not remove this bellow
    //it is there so that getx wont show exception

    return TextFormField(
      onTap: onTap,
      // key: key,

      readOnly: readonly ?? false,
      cursorColor: const Color(0xffAEACAC),
      onChanged: onChanged,

      controller: controller,
      keyboardType: keyboardType,
      validator: validator,

      style: textStyle ??
          const TextStyle(
            color: Color(0xff000000),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),

      inputFormatters: inputFormatters,
      textInputAction: TextInputAction.done,
      maxLines: isPassword || obscurePassword ? 1 : maxLines,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      decoration: InputDecoration(
          contentPadding: contentPadding,
          isDense: isdense,
          fillColor: filledColor,
          filled: true,
          errorMaxLines: 3,
          hintText: hintText,
          labelText: showhintInlabel ? hintText : null,
          labelStyle: labelstyle ??
              const TextStyle(
                color: Color.fromARGB(255, 49, 49, 49),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
          prefixIcon: prefixIcon,
          prefixIconColor: const Color(0xffBEC1CD),
          suffixIcon: suffixIcon,
          suffixIconColor: const Color(0xffBEC1CD),
          hintStyle: hintstyle ??
              const TextStyle(
                color: Color(0xFFA2A2A2),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
          counterText: "",
          focusedBorder: focussedborder ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: borderColor ?? const Color(0xFfC3C7E5),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius ?? 16),
                  )),
          enabledBorder: border ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: borderColor ?? const Color(0xFfC3C7E5),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius ?? 16),
                  )),
          border: border ??
              OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: Color(0xFfC3C7E5),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius ?? 16), //C3C7E5
                  ))),
    );
  }
}
