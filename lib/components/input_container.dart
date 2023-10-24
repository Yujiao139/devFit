import 'package:flutter/material.dart';
import 'package:ox_tech/components/text_container.dart';

class InputField extends StatelessWidget {
  final String inputText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const InputField({
    Key? key, 
    required this.inputText, 
    this.icon = Icons.person, 
    required this.onChanged,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFIeldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: inputText,
          icon: Icon(
            icon,
            color: Colors.white,
            ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
