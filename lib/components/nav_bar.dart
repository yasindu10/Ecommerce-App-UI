import 'package:e_commerze/providers/page_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              color: Colors.white,
            ),
            child: Consumer(
              builder: (context, ref, child) => GNav(
                selectedIndex: ref.watch(currentPageProvider),
                onTabChange: (value) {
                  ref
                      .watch(currentPageProvider.notifier)
                      .update((state) => value);
                },
                gap: 12,
                rippleColor: Colors.white,
                mainAxisAlignment: MainAxisAlignment.center,
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                tabs: const [
                  GButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 17,
                      horizontal: 20,
                    ),
                    icon: Icons.auto_awesome_rounded,
                    text: 'For you',
                  ),
                  GButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 17,
                      horizontal: 20,
                    ),
                    icon: Icons.search_rounded,
                    text: 'Search',
                  ),
                  GButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 17,
                      horizontal: 20,
                    ),
                    icon: Icons.person_outline_rounded,
                    text: 'Profile',
                  ),
                  GButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 17,
                      horizontal: 20,
                    ),
                    icon: Icons.shopping_cart_outlined,
                    text: 'Cart',
                  )
                ],
                tabBackgroundColor: Colors.grey[100]!,
              ),
            ),
          )
        ],
      ),
    );
  }
}
