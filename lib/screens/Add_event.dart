import 'package:evently/app_theme.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/models/Event_Model.dart';
import 'package:evently/models/categories_model.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/widgets/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class editfromevents extends StatelessWidget {
  int currentIndex = 0;
  static const routeName = '/editfromevents';

  editfromevents({super.key});
  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('d MMMM');
    final timeFormat = DateFormat('hh:mm a');
    AppLocalizations l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final EventModel? event = ModalRoute.of(context)!.settings.arguments as EventModel?;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? AppTheme.navy : AppTheme.white,
        title: Text(
          l10n.eventDetails,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: isDarkMode ? AppTheme.primaryLight : AppTheme.primaryDark,
            ),
            onPressed: () async{
              // Navigate to the edit event screen with the event data
             await Navigator.pushNamed(
                context,
                '/EditEventScreen',
                arguments: event,
              );
              if(context.mounted){
                Navigator.pop(context);
              }
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: isDarkMode ? AppTheme.red : AppTheme.red,
            ),
            onPressed: () async {
              
             await firebase_services.deleteEvent(event!.id);
              if(context.mounted){
                await Provider.of<eventsProvider>(context, listen: false).getEvents();
                Navigator.pop(context);
              }
            },
          ),
        ],
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
                  'assets/images/${event?.category.ImageName}.png',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.23,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 16),
              Text(
                event?.title ?? '',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: isDarkMode ? AppTheme.navy : AppTheme.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  children: [
                  SvgPicture.asset(
                    'assets/icons/Frame 2026.svg',
                    width: 40,
                    height: 40,
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       dateFormat.format(event?.date ?? DateTime.now()),
                        style: isDarkMode
                            ? Theme.of(context).textTheme.titleSmall
                            : Theme.of(context).textTheme.titleSmall?.copyWith(color: AppTheme.backgroundDark),
                      ),
                      Text(
                        timeFormat.format(event?.date ?? DateTime.now()),
                        style: isDarkMode
                            ? Theme.of(context).textTheme.titleSmall?.copyWith(color: AppTheme.backgroundDark)
                            : Theme.of(context).textTheme.titleSmall,
                      ),
                      
                    ],
                    
                  ),
                  
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                l10n.description,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                       height: 100,
                       width: double.infinity,
                        decoration: BoxDecoration(
                          color: isDarkMode ? AppTheme.navy : AppTheme.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Text(
                          event?.description ?? '',
                          style: isDarkMode
                              ? Theme.of(context).textTheme.titleSmall?.copyWith(color: AppTheme.backgroundDark)
                              : Theme.of(context).textTheme.titleSmall?.copyWith(color: AppTheme.black),
                          overflow: TextOverflow.ellipsis,
                           maxLines: 9,
                        ),
                       
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
