import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions; // Adiciona o parâmetro actions
  final Widget? leading; // Adiciona o parâmetro leading

  CustomAppBar({required this.title, this.actions, this.leading});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true, // Centraliza o título
      title: Text(
        title,
        style: TextStyle(color: Colors.white), // Define o texto do título como branco
      ),
      backgroundColor: Color(0xFFFF7700), // Cor laranja
      leading: leading ?? IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Define o ícone 'leading' como branco
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: actions != null
          ? actions!.map((action) {
        if (action is ElevatedButton) {
          // Define a cor do texto dos ElevatedButtons como branca
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFF7700), // Cor de fundo dos botões
              foregroundColor: Colors.white, // Cor do texto
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: action.onPressed,
            child: action.child,
          );
        } else if (action is IconButton) {
          // Define a cor do ícone dos botões como branca
          return IconButton(
            icon: action.icon,
            color: Colors.white,
            onPressed: action.onPressed,
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: action,
        );
      }).toList()
          : [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
