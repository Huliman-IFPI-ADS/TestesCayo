import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class Text_Input extends StatefulWidget {
  final String? placeholder;
  final int id;
  final bool obscureText;

  const Text_Input({Key? key, required this.id, this.placeholder, this.obscureText = false}) : super(key: key);

  @override
  _Text_InputState createState() => _Text_InputState();
}

class _Text_InputState extends State<Text_Input> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 300,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: widget.placeholder,
                  hintStyle: TextStyle(color: AppColors.grey),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.black),
                obscureText: widget.obscureText ? _obscureText : false, // Use o valor de _obscureText apenas se obscureText for verdadeiro
              ),
              if (widget.obscureText) // Se obscureText for true, exibe o botão de visibilidade
                IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
