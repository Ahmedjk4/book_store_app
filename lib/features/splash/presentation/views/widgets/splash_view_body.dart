import 'package:book_store/core/utils/app_router.dart';
import 'package:book_store/core/utils/assets.dart';
import 'package:book_store/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> slidingAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    if (mounted) {
      initSlidingAnimation();
    }
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {},
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo),
            SlidingText(slidingAnimation: slidingAnimation),
            Align(
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                onPressed: () {
                  context.go(AppRouter.homePath);
                },
                color: Colors.black,
                textColor: Colors.white,
                child: const Text('Skip'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2, milliseconds: 500),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 25), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
    animationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
        Future.delayed(const Duration(seconds: 2), () {
          context.go(AppRouter.homePath);
        });
      }
    });
  }
}
