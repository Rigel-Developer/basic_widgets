import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = [
  SlideInfo(
    'Welcome to App Tutorial',
    'This is a simple app tutorial screen',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Slide 2',
    'This is the second slide',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Slide 3',
    'This is the third slide',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController _pageController = PageController();
  bool _isLastPage = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    _pageController.addListener(() {
      final page = _pageController.page ?? 0;
      if (!_isLastPage && page >= slides.length - 1.5) {
        setState(() {
          _isLastPage = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('App Tutorial'),
      ),
      body: Stack(
        children: [
          PageView(
            // scrollDirection: Axis.vertical,
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slide) => _Slide(
                      title: slide.title,
                      caption: slide.caption,
                      imageUrl: slide.imageUrl,
                    ))
                .toList(),
          ),
          Positioned(
            top: 20,
            right: 50,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Skip'),
            ),
          ),
          _isLastPage
              ? Positioned(
                  bottom: 20,
                  right: 20,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text('Start'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            const SizedBox(height: 16),
            Text(title, style: titleStyle),
            const SizedBox(height: 8),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
