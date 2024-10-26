import 'package:front_end_task/utils/utils.dart';

import '../../../../../elements/constants/constants.dart';
import 'event_card.dart';

class UpcomingSection extends StatelessWidget {
  const UpcomingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text20(
          text: 'Upcoming',
          style: AppTypography.kAppStyle(fontSize: 24),
        ),
        const SizedBox(height: 16),
        ...Utils().upcomingEvents.map((event) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: EventCard(
              title: event.title,
              subtitle: event.subtitle,
              times: event.times,
              accentColor: event.accentColor,
              attendeeCount: event.attendeeCount,
              time: '07:00',
            ),
          );
        }),
      ],
    );
  }
}
