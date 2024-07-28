import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import 'constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    this.isOutlined = false,
    required this.onPressed,
  });

  final String buttonText;
  final bool isOutlined;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: isOutlined ? Colors.white : kTextColor,
          border: Border.all(color: kTextColor, width: 2.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: isOutlined ? kTextColor : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField2 extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  String hinttext;

  CustomTextField2({
    required this.controller,
    required this.onChanged,
    required this.hinttext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.black,
          ), // Search icon
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: hinttext,
                hintStyle: TextStyle(
                  color: Colors.black45,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopScreenImage extends StatelessWidget {
  const TopScreenImage({super.key, required this.screenImageName});
  final String screenImageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage('assets/images/$screenImageName'),
        ),
      ),
    );
  }
}

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: kTextColor),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.textField, required this.icon});
  final TextField textField;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
        ),
      ),
      child: Row(
        children: [
          icon, // Custom icon
          const SizedBox(width: 10),
          Expanded(child: textField),
        ],
      ),
    );
  }
}

class CustomTextFieldPass extends StatefulWidget {
  final TextField textField;
  final Icon icon;

  const CustomTextFieldPass({
    super.key,
    required this.textField,
    required this.icon,
  });

  @override
  _CustomTextFieldPassState createState() => _CustomTextFieldPassState();
}

class _CustomTextFieldPassState extends State<CustomTextFieldPass> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
      ),
      child: Row(
        children: [
          widget.icon, // Custom icon
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              obscureText: _isObscured,
              onChanged: widget.textField.onChanged,
              style: widget.textField.style,
              decoration: widget.textField.decoration!.copyWith(
                hintText: 'Password',
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CustomBottomScreen extends StatelessWidget {
  const CustomBottomScreen({
    super.key,
    required this.textButton,
    this.heroTag = '',
    required this.buttonPressed,
  });
  final String textButton;

  final String heroTag;
  final Function buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          child: Align(
            alignment: Alignment.center,
            child: Hero(
              tag: heroTag,
              child: CustomButton(
                buttonText: textButton,
                onPressed: () {
                  buttonPressed();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Alert signUpAlert({
  required Function onPressed,
  required String title,
  required String desc,
  required String btnText,
  required BuildContext context,
}) {
  return Alert(
    context: context,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
        onPressed: () {
          onPressed();
        },
        width: 120,
        child: Text(
          btnText,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    ],
  );
}

Alert showAlert({
  required Function onPressed,
  required String title,
  required String desc,
  required BuildContext context,
}) {
  return Alert(
    context: context,
    type: AlertType.error,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
        onPressed: () {
          onPressed();
        },
        width: 120,
        child: const Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ],
  );
}
