import 'package:busca_preco/core/utils/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              _selectedIndex.value = index;
            },
            children: [
              _buildPage('Página 1', Colors.blue),
              _buildPage('Página 2', Colors.green),
              _buildPage('Página 3', Colors.orange),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ValueListenableBuilder<int>(
              valueListenable: _selectedIndex,
              builder: (context, selectedIndex, child) {
                return AppNavigation(
                  pageController: _pageController,
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    _selectedIndex.value = index;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String title, Color color) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}
