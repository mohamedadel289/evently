import 'package:evently/app_theme.dart';
import 'package:evently/models/onborading_model.dart';
import 'package:evently/provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently/l10n/app_localizations.dart';

class FinalOnbordingScreen extends StatefulWidget {
  static const String routeName = '/FinalOnbordingScreen';

  const FinalOnbordingScreen({super.key});

  @override
  State<FinalOnbordingScreen> createState() => _FinalOnbordingScreenState();
}

class _FinalOnbordingScreenState extends State<FinalOnbordingScreen> {
  final List<OnboardingModel> onboardingData = OnboardingModel.getOnboardingData();
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose(); // تحرير الذاكرة
    super.dispose();
  }
  // //void skipLastPage() {
  //  // pageController.animateToPage(onboardingData.length , duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  // }

  void finishOnboarding() {
    Navigator.pushReplacementNamed(context, '/LoginScreen');
  }

  void nextPage() {
    if (currentIndex < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      finishOnboarding();
    }
  }

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    final primaryColor = Theme.of(context).primaryColor;
    final isDark = settingProvider.isDarkMode;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),

              // الشريط العلوي (رجوع عند الحاجة + لوجو في المنتصف + زر Skip)
              Row(
                children: [
                  SizedBox(
                    width: 48,
                    child: currentIndex > 0
                        ? IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              size: 18,
                              color: isDark ? AppTheme.white : AppTheme.black,
                            ),
                            onPressed: () {
                              pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          )
                        : null,
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 28,
                    fit: BoxFit.scaleDown,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: currentIndex == onboardingData.length - 1 ? null : nextPage,
                    child: Text(
                      currentIndex == onboardingData.length - 1 ? '' : l10n.skip,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 16,
                            color: isDark ? AppTheme.white : AppTheme.black,
                          ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // عرض صفحات الـ Onboarding
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final onboardingItem = onboardingData[index];
                    final title = switch (index) {
                      0 => l10n.findEventsThatInspireYou,
                      1 => l10n.effortlessEventPlanning,
                      _ => l10n.connectWithFriends,
                    };
                    final description = switch (index) {
                      0 => l10n.findEventsDescription,
                      1 => l10n.effortlessEventPlanningDescription,
                      _ => l10n.connectWithFriendsDescription,
                    };
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Center(
                            child: Image.asset(
                              onboardingItem.imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: currentIndex == index ? 22 : 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index ? primaryColor : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
                        const SizedBox(height: 24),
                        Text(
                          title,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: isDark ? AppTheme.white : AppTheme.black,
                              ),
                        ),
                        
                        const SizedBox(height: 10),
                        Text(
                          description,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 14,
                                height: 1.4,
                                color: AppTheme.grey,
                              ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // مؤشر النقاط (Dots Indicator)
              

              const SizedBox(height: 20),

              // زر Next / Let's Start
              ElevatedButton(
                onPressed: nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  currentIndex == onboardingData.length - 1 ? l10n.letsStart : l10n.next,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}