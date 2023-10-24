import 'package:flutter/material.dart';
import 'package:ox_tech/components/text_container.dart';
class PasswordContainer extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const PasswordContainer({
    Key? key, 
    required this.onChanged,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFIeldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: "Password",
          icon: Icon(Icons.lock,
          color: Colors.white,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.white,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

