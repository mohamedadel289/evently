import 'package:evently/app_theme.dart';
import 'package:evently/models/categories_model.dart';
import 'package:evently/tabs/home/tab_items.dart';
import 'package:evently/widgets/defualt_text_form_filed.dart';
import 'package:evently/widgets/elvated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatefulWidget {
  static const String routeName = 'create_event_screen';

  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int currentIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundLight,
        title: Text('Add Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),

                child: Image.asset(
                  'assets/images/sport.png',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.23,
                  fit: BoxFit.fill,
                ),
              ),
              DefaultTabController(
                length: CategoriesModel.Categories.length,
                child: TabBar(
                  onTap: (index) {
                    if (currentIndex == index) return;
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  isScrollable: true,
                  padding: EdgeInsets.symmetric(vertical: 24),
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  labelPadding: EdgeInsets.only(right: 8),
                  tabAlignment: .start,
                  tabs: CategoriesModel.Categories.map(
                    (Category) => TabItems(
                      title: Category.label,
                      icon: Category.icon,
                      isSelected:
                          currentIndex ==
                          CategoriesModel.Categories.indexOf(Category),
                    ),
                  ).toList(),
                ),
              ),
              Text(
                'Title',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: AppTheme.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              DefaultTextFormField(
                controller: titleController,
                hintText: 'Event Title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter event title';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),
              Text(
                'Description',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: AppTheme.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              DefaultTextFormField(
                controller: descriptionController,
                hintText: 'Event Description',
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter event description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/calendar-add.svg',
                    width: 24,
                    height: 24,
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Event Date',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppTheme.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                        initialDate: selectedDate,
                        initialEntryMode: .calendarOnly,  
                      );
                      if (date == null) return;
                      setState(() {
                        selectedDate = date;
                      });
                    },
                    child: Text(
                     selectedDate ==null? 'Choose date': dateFormat.format(selectedDate!),
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: AppTheme.primaryLight,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/clock.svg',
                    width: 24,
                    height: 24,
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Event Time',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppTheme.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () async {
                      TimeOfDay? Time = await showTimePicker(
                        context: context,
                        initialTime:selectedTime ?? TimeOfDay.now(),
                      );
                      if (Time == null) return;
                      setState(() {
                        selectedTime = Time;
                      });
                    },
                    child: Text(
                      selectedTime == null ? 'Choose time' : selectedTime!.format(context),
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: AppTheme.primaryLight,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(370, 50),
                  backgroundColor: AppTheme.primaryLight,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: Text('Add Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
