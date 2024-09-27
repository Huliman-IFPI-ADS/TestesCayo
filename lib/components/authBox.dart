import 'package:flutter/material.dart';
import 'package:huliman_mobile/theme/app_colors.dart';

class AuthBox extends StatelessWidget {
  final Widget child;
  final String titulo;
  final bool showBackButton;

  const AuthBox({
    Key? key,
    required this.child,
    required this.titulo,
    this.showBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 5),
        child: Container(
          width: 320,
          height: 342,
          decoration: BoxDecoration(
            color: AppColors.lightgrey,
            borderRadius: BorderRadius.circular(30),
          ),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 2),
                Container(
                  width: 55,
                  height: 55,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/icons/rocket.png',
                    ),
                  ),
                ),
                if (showBackButton)
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        SizedBox(width: 20),
                        Text(
                          titulo,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkblue,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Padding(
                    padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                    child: Text(
                      titulo,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkblue,
                      ),
                    ),
                  ),
                child, // Adicionando o widget filho aqui
              ],
            ),
          ),
        ),
      ),
    );
  }
}
