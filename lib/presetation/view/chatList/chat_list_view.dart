import 'package:front_end_task/elements/constants/constants.dart';
import '../../../elements/widgets/textfields/search_field.dart';
import 'layout/components/chat_list.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SearchField(
            controller: TextEditingController(),
          ),
          const Divider(height: 3, color: AppColors.kGray),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildSectionTitle('PINNED'),
                MessagesList(isPinned: true),
                const SizedBox(height: 24),
                _buildSectionTitle('ALL MESSAGES'),
                MessagesList(isPinned: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Text15(
        text: title,
        style:
            AppTypography.kAppStyle(fontWeight: FontWeight.w600, fontSize: 15)
                .copyWith(color: AppColors.kGrayText),
      ),
    );
  }
}
