import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Top Items
          Column(
            children: [
              //Header
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              //Space Between Elements
              const SizedBox(height: 25),

              //Shop tile
              MyListTile(
                icon: Icons.home,
                text: "Shop",
                onTap: () => {
                  Navigator.pop(context),
                  Navigator.pushNamed(context, '/shop_page'),
                },
              ),

              //Cart tile
              MyListTile(
                icon: Icons.shopping_cart,
                text: "Cart",
                onTap: () => {
                  Navigator.pop(context),
                  Navigator.pushNamed(context, '/cart_page'),
                },
              ),

              //Cart tile
              MyListTile(
                icon: Icons.favorite,
                text: "Favorites",
                onTap: () => {
                  Navigator.pop(context),
                  Navigator.pushNamed(context, '/favorite_page'),
                },
              ),
            ],
          ),

          //Bottom Items
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            //Exit
            child: MyListTile(
              icon: Icons.logout,
              text: "Exit",
              onTap: () => {
                Navigator.pop(context),
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/intro_page',
                  (route) => false,
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
