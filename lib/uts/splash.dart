import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';

import 'play.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 150,),
            const FlickerNeonText(
              text: "Tic Tac Toe",
              fontFamily: 'Lobster',
              textAlign: TextAlign.center,
              flickerTimeInMilliSeconds: 1000,
              spreadColor: Colors.red,
              blurRadius: 20,
              textSize: 54,
            ),
            const SizedBox(height: 300,),
            NeonAddItemButton(
                borderColor: Colors.deepOrange.shade50,
                spreadColor: Colors.deepOrange,
                lightSpreadRadius: 3,
                lightBlurRadius: 18,
              data: 'Mainkan',
              icon: Icons.arrow_right,
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Play())),
            ),

          ],
        ),
      ),
    );
  }
}
