import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tezz_cafe/utils/colors/colors.dart';

class GlobalTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final IconData? prefixIcon;
  final String caption;
  final TextEditingController? controller;
  final ValueChanged? onChanged;

  const GlobalTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    this.prefixIcon,
    required this.caption,
    this.controller, this.onChanged,
  }) : super(key: key);

  @override
  _GlobalTextFieldState createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  bool _isPasswordVisible = false;
  late MaskTextInputFormatter _phoneMaskFormatter;

  @override
  void initState() {
    super.initState();
    _phoneMaskFormatter = MaskTextInputFormatter(
      mask: '+(998) ## ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.caption.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              widget.caption,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.captionColor,
              ),
            ),
          ),
        const SizedBox(
          height: 4,
        ),
        TextField(
          onTapOutside: (event){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          cursorColor: AppColors.black,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon != null
                ? Icon(
              widget.prefixIcon,
              color: Colors.grey,
            )
                : null,
            suffixIcon: widget.keyboardType == TextInputType.visiblePassword
                ? IconButton(
              splashRadius: 1,
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.black,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.black, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: AppColors.textFieldColor
          ),
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.keyboardType == TextInputType.phone
              ? [_phoneMaskFormatter]
              : null,
          obscureText: widget.keyboardType == TextInputType.visiblePassword
              ? !_isPasswordVisible
              : false,
        ),
      ],
    );
  }
}

