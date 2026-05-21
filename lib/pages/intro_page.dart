import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_button.dart';
import 'package:minimal_shop/utils/app_routes.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Style
      backgroundColor: Theme.of(context).colorScheme.surface,

      //Body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            //Space Between Elements
            const SizedBox(height: 25),

            //Title
            Text(
              "Minimal Shop",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            //Subtitle
            Text(
              "Premium Quality Products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            //Space Between Elements
            const SizedBox(height: 25),

            //Button
            MyButton(
              onTap: () => Navigator.pushNamed(context, AppRoutes.ShopPage),
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
