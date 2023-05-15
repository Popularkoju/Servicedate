import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Constants/SpacePalette.dart';
import 'Constants/groceli_icon_icons.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? enable;
  final bool? readOnly;

  final bool? enableSuggestion;
  final String? errorText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Function()? onObscurePressed;
  final Function()? onTap;
  final int? maxLength;
  final int? maxLines;
  final FocusNode? node;
  final Widget? suffixIcon;

  CustomTextField(
      {this.enable,
        this.readOnly,
      this.suffixIcon,
      this.labelText,
      this.controller,
      this.obscureText,
      this.errorText,
      this.onChanged,
      this.keyboardType,
      this.onObscurePressed,
      this.maxLength,
      this.node,
      this.maxLines,
      this.enableSuggestion,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return SpacePalette.addPaddingMediumV(
      TextField(

        focusNode: node,
        // style: enable ?? true ? null : const TextStyle(color: Colors.grey),
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
        enableSuggestions: enableSuggestion ?? true,
        controller: controller,
        obscureText: obscureText ?? false,
        obscuringCharacter: "*",
        keyboardType: keyboardType,
        onChanged: onChanged,
        enabled: enable,
        readOnly: readOnly?? false,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          // prefixIcon: prefixIcon,
          suffixIcon: obscureText != null
              ? GestureDetector(
                  onTap: onObscurePressed ?? () {},
                  child: !obscureText!
                      ? Icon(
                          Icons.visibility,
                          color: Theme.of(context).primaryColor,
                        )
                      : const Icon(GroceliIcon.password),
                )
              : suffixIcon,
          errorText: errorText,
        ),
        onTap: onTap ?? () {},
      ),
    );
  }
}
