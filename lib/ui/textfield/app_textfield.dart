import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class AppTextField extends StatefulWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final Function()? onPressed;
  final TextEditingController? controller;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final Color? textColor;
  final String hintText;
  final Color? hintColor;
  final String? initialValue;
  final bool? autoFocus;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final FormFieldSetter<String>? onSaved;
  final Function(String)? onFieldSubmitted;
  final bool? readOnly;
  final int? maxLength;
  final bool? obscureText;
  final String obscuringCharacter;
  final Widget Function(bool enabled, String value)? suffixIcon;
  final Widget Function()? prefixIcon;
  final Key? key;
  final Widget Function()? prefix;
  final bool enabled;
  final int maxLines;
  final int minLines;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final bool busy;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool filled;
  final Color? filledColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final String? font;
  final EdgeInsets dividerPadding;
  final Function? labelIcon;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;
  final Color? borderColor;
  final Color? borderErrorColor;
  final bool validField;
  final double? letterSpacing;
  final EdgeInsets? contentPadding;
  final bool showOutLineInputBorder;

  const AppTextField(
      {this.height,
      this.width,
      this.child,
      this.onPressed,
      this.controller,
      this.inputAction= TextInputAction.next,
      this.inputType,
      this.textColor,
      required this.hintText,
      this.hintColor = AppColor.color6E6E6E,
      this.initialValue,
      this.autoFocus= false,
      this.validator,
      this.onSaved,
      this.readOnly= false,
      this.maxLength,
      this.key,
      this.obscureText= false,
      this.obscuringCharacter= '•',
      this.suffixIcon,
      this.prefixIcon,
      this.prefix,
      this.enabled= true,
      this.inputFormatters,
      this.busy= false,
      this.maxLines= 1,
      this.minLines= 1,
      this.onChanged,
      this.filled= false,
      this.fontSize = 14,
      this.fontWeight,
      this.font,
      this.filledColor,
      this.onFieldSubmitted,
      this.labelIcon,
      this.dividerPadding= const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      this.floatingLabelBehavior: FloatingLabelBehavior.never,
      this.textAlign= TextAlign.start,
      this.marginLeft = 0,
      this.marginTop = 0,
      this.marginRight = 0,
      this.marginBottom = 0,
        this.borderColor,
        this.borderErrorColor,
        this.validField = false,
        this.letterSpacing,
        this.contentPadding,
        this.showOutLineInputBorder = true,
      })
      : super(key: key);

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  late bool _secureText;
  final FocusNode _focusNode = FocusNode();
  bool _isValid = true;

  @override
  void initState() {
    super.initState();
    _secureText = widget.obscureText!;
    _focusNode.addListener(_onFocusChange);
  }

  bool get secureText => _secureText;

  set secureText(bool value) {
    setState(() {
      _secureText = value;
    });
  }

  bool get isValid => _isValid;

  set isValid(bool value) {
    setState(() {
      _isValid = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        child: Container(
          margin: EdgeInsets.fromLTRB(widget.marginLeft, widget.marginTop, widget.marginRight, widget.marginBottom),
          child: Column(
            children: [
              TextFormField(
                focusNode: _focusNode,
                maxLength: widget.maxLength,
                textAlign: widget.textAlign,
                cursorColor: AppColor.black,
                style: TextStyle(
                  color: widget.textColor ?? Colors.black,
                  fontSize: SystemTheme.scale(widget.fontSize),
                  fontWeight: widget.fontWeight,
                  letterSpacing: widget.letterSpacing,
                  fontFamily: widget.font ?? FontEnum.GRegular.toString(),
                ),
                initialValue: widget.initialValue,
                autofocus: widget.autoFocus!,
                textInputAction: widget.inputAction,
                keyboardType: widget.inputType,
                inputFormatters: widget.inputFormatters,
                readOnly: widget.readOnly ?? false,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                obscureText: secureText,
                obscuringCharacter: widget.obscuringCharacter,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                         SystemTheme.dp8,
                      ),
                      borderSide: BorderSide(
                        color: widget.borderColor ?? Theme.of(context).colorScheme.inputBoxBorder,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                         widget.showOutLineInputBorder ? SystemTheme.dp8 : 0,
                      ),
                      borderSide: BorderSide(
                        color: widget.showOutLineInputBorder ? Theme.of(context).colorScheme.inputBoxBorder : AppColor.transparent,
                      ),
                    ),
                    fillColor: widget.filledColor ?? AppColor.black,
                    hintText: widget.hintText,
                    hintMaxLines: 1,
                    filled: widget.filled,
                    hintStyle: TextStyle(
                      color: widget.hintColor,
                      fontSize: SystemTheme.scale(widget.fontSize),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0,
                      fontFamily: widget.font ?? FontEnum.GRegular.toString(),
                    ),
                    prefix: widget.prefix?.call(),
                    prefixIcon: widget.prefixIcon?.call(),
                    prefixIconConstraints: const BoxConstraints.tightForFinite(),
                    alignLabelWithHint: true,
                    isDense: true,
                    counterText: "",
                    suffixIcon: widget.suffixIcon?.call(isValid, widget.controller!.text),
                    suffixIconConstraints: BoxConstraints.tight(const Size(30, 30)),
                    enabled: widget.enabled,
                    floatingLabelBehavior: widget.floatingLabelBehavior,
                    contentPadding: widget.contentPadding
                    ),
                    controller: widget.controller,
                    validator: widget.validator,
                    onSaved: widget.onSaved,
                    onFieldSubmitted: widget.onFieldSubmitted,
                    onChanged: (value) {
                      widget.onChanged?.call(value);
                },
              ),
            ],
          ),
        ),
    );
  }

  void _onFocusChange() {
    setState(() {
      isValid = true;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

}
