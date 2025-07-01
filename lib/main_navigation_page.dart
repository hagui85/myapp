import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:myapp/features/chewie_video/presentation/pages/chewie_video_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  final _pageController = PageController();
  final _controller = NotchBottomBarController(index: 0);
  int maxCount = 3;

  final List<Widget> _pages = [
    const ChewieVideoPage(), // Replace with real page
    const Center(child: Text('Page 2')),
    const Center(child: Text('Page 3')),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        bottomBarItems: [
          const BottomBarItem(
            inActiveItem: Icon(Icons.video_collection, color: Colors.blueGrey),
            activeItem: Icon(Icons.video_collection, color: Colors.blueAccent),
            itemLabel: 'Page 1',
          ),
          const BottomBarItem(
            inActiveItem: Icon(Icons.star, color: Colors.blueGrey),
            activeItem: Icon(Icons.star, color: Colors.blueAccent),
            itemLabel: 'Page 2',
          ),
          // Item for the third page
          const BottomBarItem(
            // Inactive icon using an SVG asset
            /* inActiveItem: SvgPicture.asset(
              'assets/search_icon.svg',
              colorFilter: const ColorFilter.mode(Colors.blueGrey, BlendMode.srcIn),
            ),
            activeItem: SvgPicture.asset(
              'assets/search_icon.svg',
              color: Colors.black,
            ),*/
            inActiveItem: Icon(Icons.accessibility_new, color: Colors.blueGrey),
            activeItem: Icon(Icons.accessibility_new, color: Colors.blueAccent),
            itemLabel: 'Page 3',
          ),
        ],
        onTap: (index) => _pageController.jumpToPage(index),
        color: Colors.white,
        notchColor: Colors.black,
        kIconSize: 24.0, // ✅ Add this line
        kBottomRadius: 12.0, // ✅ And this one
      ),
    );
  }
}
