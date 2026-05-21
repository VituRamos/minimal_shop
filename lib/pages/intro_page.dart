import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_button.dart';
import 'package:minimal_shop/utils/app_routes.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      //Style
      backgroundColor: Theme.of(context).colorScheme.surface,

      //Body
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Space Between Elements
              const SizedBox(height: 40),

              Column(
                children: [
                  Text(
                    "Just a Shop.",
                    style: TextStyle(
                      color: colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      letterSpacing: 1.2,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    "Premium quality items, minimal design.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colorScheme.inversePrimary,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              SizedBox(
                width: 220,
                child: MyButton(
                  onTap: () => Navigator.pushNamed(context, AppRoutes.ShopPage),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Get Started",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
