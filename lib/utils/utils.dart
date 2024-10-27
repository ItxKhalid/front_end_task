import '../elements/constants/app_assets.dart';
import '../elements/constants/constants.dart';
import '../infrastracture/models/event_model.dart';

class Utils{
  final List<Map<String, String>> drawerItems = [
    {'image': AppAssets.kOverviewPng, 'name': 'Overview'},
    {'image': AppAssets.kEComSvg, 'name': 'E-Commerce'},
    {'image': AppAssets.kCalenderSvg, 'name': 'Calendar'},
    {'image': AppAssets.kMailSvg, 'name': 'Mail'},
    {'image': AppAssets.kChatSvg, 'name': 'Chat'},
    {'image': AppAssets.kTaskSvg, 'name': 'Task'},
    {'image': AppAssets.kProjectsSvg, 'name': 'Projects'},
    {'image': AppAssets.kFileSvg, 'name': 'File Manager'},
    {'image': AppAssets.kNotesSvg, 'name': 'Notes'},
    {'image': AppAssets.kContactSvg, 'name': 'Contacts'},
  ];

  List<Event> upcomingEvents = [
    Event(
      title: 'Brandbook and Guidebook',
      subtitle: 'Design',
      times: ['07:00', '07:30', '08:00'], // 30-minute intervals
      accentColor: Colors.orange,
      attendeeCount: 4,
    ),
    Event(
      title: 'Marketing Meeting',
      subtitle: 'Strategy',
      times: ['08:30', '09:00', '09:30'],
      accentColor: Colors.blue,
      attendeeCount: 10,
    ),
    Event(
      title: 'Product Launch',
      subtitle: 'Presentation',
      times: ['10:00', '10:30', '11:00'],
      accentColor: Colors.green,
      attendeeCount: 20,
    ),
    Event(
      title: 'Product Launch',
      subtitle: 'Presentation',
      times: ['11:30', '12:00', '12:30'],
      accentColor: Colors.grey,
      attendeeCount: 20,
    ),
  ];

  static final List<Map<String, dynamic>> chatList = [
    {
      'name': 'Alphaboard',
      'message': 'Hello, Mark! I am wr...',
      'isPinned': true,
      'unreadCount': 3,
      'isOnline': false,
      'useTextAvatar': true,
      'avatarText': 'A',
      'avatar': null,
    },
    {
      'name': 'Design Team',
      'message': 'Hello. Can you drop t...',
      'isPinned': true,
      'unreadCount': null,
      'isOnline': false,
      'useTextAvatar': true,
      'avatarText': 'DT',
      'avatar': null,
    },
    {
      'name': 'Dustin Williamson',
      'message': 'Dustin is typing...',
      'isPinned': true,
      'unreadCount': 5,
      'isOnline': true,
      'useTextAvatar': false,
      'avatar': 'assets/images/Avatar.svg',
    },
    {
      'name': 'Jane Wilson',
      'message': 'Hi! How are you, Steve? 😃',
      'isPinned': false,
      'unreadCount': null,
      'isOnline': true,
      'useTextAvatar': false,
      'avatar': 'assets/images/Avatar1.svg',
    },
    {
      'name': 'Brandon Pena',
      'message': 'Hi! How are you, Brandon? 😃',
      'isPinned': false,
      'unreadCount': null,
      'isOnline': false,
      'useTextAvatar': false,
      'avatar': AppAssets.kAvatarPro,
    },
    {
      'name': 'Natan Fox',
      'message': 'Hello we have meeting...',
      'isPinned': false,
      'unreadCount': null,
      'isOnline': false,
      'useTextAvatar': false,
      'avatar': AppAssets.kAvatarPro,
    },
    {
      'name': 'Jacob Hawkins',
      'message': 'Well done!👍',
      'isPinned': false,
      'unreadCount': 1,
      'isOnline': true,
      'useTextAvatar': false,
      'avatar': AppAssets.kAvatar3,
    },
  ];
}