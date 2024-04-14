import 'package:e_commerze/components/nav_bar.dart';
import 'package:e_commerze/pages/cart_page.dart';
import 'package:e_commerze/pages/for_you_page.dart';
import 'package:e_commerze/pages/profile_page.dart';
import 'package:e_commerze/pages/search_page.dart';
import 'package:e_commerze/providers/page_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<Widget> pages = const [
    ForYouPage(),
    SearchPage(),
    ProfilePage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(),
      body: pages[ref.watch(currentPageProvider)],
    );
  }
}
