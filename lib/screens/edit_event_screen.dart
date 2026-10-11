import 'package:evently/app_theme.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/models/Event_Model.dart';
import 'package:evently/models/categories_model.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/setting_provider.dart';
import 'package:evently/tabs/home/tab_items.dart';
import 'package:evently/widgets/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditEventScreen extends StatefulWidget {
  static const String routeName = '/EditEventScreen';
  const EditEventScreen({super.key});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  CategoriesModel selectedCategory = CategoriesModel.Categories.first;
  int currentIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EventModel? event;
  bool isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInitialized) {
      event = ModalRoute.of(context)?.settings.arguments as EventModel?;
      if (event != null) {
        titleController.text = event!.title;
        descriptionController.text = event!.description;
        selectedDate = event!.date;
        selectedTime = TimeOfDay.fromDateTime(event!.date);

       
        final catIndex = CategoriesModel.Categories.indexWhere(
          (c) => c.id == event!.category.id,
        );
        if (catIndex != -1) {
          currentIndex = catIndex;
          selectedCategory = CategoriesModel.Categories[currentIndex];
        }
      }
      isInitialized = true;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<SettingProvider>(context).isDarkMode;
    AppLocalizations l10n = AppLocalizations.of(context)!;

    String categoryLabel(String id) => switch (id) {
          'sport' => l10n.sport,
          'birthday' => l10n.birthday,
          'meeting' => l10n.meeting,
          _ => id,
        };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? AppTheme.navy : AppTheme.white,
        title: Text(
          'Edit Event',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    'assets/images/${CategoriesModel.Categories[currentIndex].ImageName}.png',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.23,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 16),
                DefaultTabController(
                  length: CategoriesModel.Categories.length,
                  initialIndex: currentIndex,
                  child: TabBar(
                    onTap: (index) {
                      if (currentIndex == index) return;
                      setState(() {
                        currentIndex = index;
                        selectedCategory = CategoriesModel.Categories[currentIndex];
                      });
                    },
                    isScrollable: true,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    labelPadding: const EdgeInsets.only(right: 8),
                    tabAlignment: TabAlignment.start,
                    tabs: CategoriesModel.Categories.map(
                      (category) => TabItems(
                        title: categoryLabel(category.id),
                        icon: category.icon,
                        isSelected:
                            currentIndex == CategoriesModel.Categories.indexOf(category),
                      ),
                    ).toList(),
                  ),
                ),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: l10n.title,
                    hintText: l10n.eventTitle,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.pleaseEnterEventTitle;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: l10n.description,
                    hintText: l10n.eventDescription,
                  ),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.pleaseEnterEventDescription;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // حقل التاريخ
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/calendar-add.svg',
                      width: 24,
                      height: 24,
                      fit: BoxFit.scaleDown,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.eventDate,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now().subtract(const Duration(days: 365)),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                          initialDate: selectedDate ?? DateTime.now(),
                        );
                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                          });
                        }
                      },
                      child: Text(
                        selectedDate == null
                            ? l10n.chooseDate
                            : dateFormat.format(selectedDate!),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppTheme.primaryLight,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // حقل الوقت
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/clock.svg',
                      width: 24,
                      height: 24,
                      fit: BoxFit.scaleDown,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.eventTime,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime: selectedTime ?? TimeOfDay.now(),
                        );
                        if (time != null) {
                          setState(() {
                            selectedTime = time;
                          });
                        }
                      },
                      child: Text(
                        selectedTime == null
                            ? l10n.chooseTime
                            : selectedTime!.format(context),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppTheme.primaryLight,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate() && event != null) {
                      final updatedEvent = EventModel(
                        id: event!.id,
                        title: titleController.text.trim(),
                        description: descriptionController.text.trim(),
                        category: selectedCategory,
                        date: DateTime(
                          selectedDate?.year ?? DateTime.now().year,
                          selectedDate?.month ?? DateTime.now().month,
                          selectedDate?.day ?? DateTime.now().day,
                          selectedTime?.hour ?? 0,
                          selectedTime?.minute ?? 0,
                        ),
                      );

                      await firebase_services.updateEvent(updatedEvent);
                      if (mounted) {
                        await Provider.of<eventsProvider>(context, listen: false).getEvents();
                        Navigator.pop(context, updatedEvent);
                      }
                    }
                  },
                  child: const Text('Update Event'),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}