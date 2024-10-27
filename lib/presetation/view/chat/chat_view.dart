import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:front_end_task/elements/constants/constants.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3E5E8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon:  const Icon(CupertinoIcons.arrow_left, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.orange[200],
              child: const Text('DT', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Design Team',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  '6 Members, 3 Online',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE8EAED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(AppAssets.kMore),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildMessage(
                      'Hi Jacob and Brandon, any progress on the project? 😊',
                      'Jane Wilson',
                      '10:43',
                      isMe: false,
                      avatarColor: Colors.pink[100],
                    ),
                    _buildMessage(
                      'Hi Jane! 👋',
                      'Jacob Hawkins',
                      '10:47',
                      isMe: true,
                    ),
                    _buildMessage(
                        showSenderInfo: false,
                        'Yes. I just finished developing the Chat template.',
                        'Jacob Hawkins',
                        '10:47',
                        isMe: true,
                        borderRadius: 24),
                    _buildImageGrid(),
                    _buildMessage(
                      'Hi Jane! I\'ve completed 16 of 20 problems so far',
                      'Brandon Pena',
                      '10:52',
                      isMe: false,
                      avatarColor: Colors.green[200],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: _buildMessage(
                        isInfoDataShown: false,
                        'Today or tomorrow I think I\'ll finish it 💪',
                        'Brandon Pena',
                        '10:52',
                        isMe: false,
                        borderRadius: 24,
                        showSenderInfo: false,
                        avatarColor: Colors.green[200],
                      ),
                    ),
                    const SizedBox(
                      height: 29,
                    ),
                    _buildDateHeader("Today, 10 June"),
                    const SizedBox(
                      height: 24,
                    ),
                    _buildMessage(
                      'It looks amazing. The customer will be very satisfied. 🤩',
                      'Jane Wilson',
                      '09:15',
                      isMe: false,
                      avatarColor: Colors.pink[100],
                    ),
                    _buildMessage(
                      '@Brandon, can you send me the Style Guide.',
                      'Jacob Hawkins',
                      '11:48',
                      isMe: true,
                      highlightedText: '@Brandon',
                    ),
                    _buildFileMessage(
                      'Brandon Pena',
                      '11:50',
                      'Brand Styles Guide',
                      '570 KB',
                      avatarColor: Colors.green[200],
                    ),
                  ],
                ),
              ),
              _buildMessageInput(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateHeader(String date) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFFEBEEF2),
            indent: 16,
            endIndent: 24,
          ),
        ),
        Text(
          date,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        const Expanded(
          child: Divider(
            color: Color(0xFFEBEEF2),
            indent: 24,
            endIndent: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildMessage(
    String message,
    String sender,
    String time, {
    bool isMe = false,
    bool showSenderInfo = true,
    bool isInfoDataShown = true,
    Color? avatarColor,
    double borderRadius = 0,
    String? highlightedText, // New parameter for highlighting text
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe && isInfoDataShown) ...[
            CircleAvatar(
              backgroundColor: avatarColor,
              radius: 16,
              child: SvgPicture.asset(
                  !isMe ? AppAssets.kAvatar2 : AppAssets.kAvatar),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (isInfoDataShown && (!isMe || (isMe && showSenderInfo)))
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text15(
                          text: sender,
                          style: AppTypography.kAppStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text14(
                          text: time,
                          style: AppTypography.kAppStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.kGrayText
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  decoration: BoxDecoration(
                    color: isMe ? Colors.blue : const Color(0xFFF5F7FA),
                    borderRadius: BorderRadius.only(
                      topLeft: isMe
                          ? const Radius.circular(24)
                          : const Radius.circular(0),
                      topRight: isMe
                          ? Radius.circular(borderRadius)
                          : const Radius.circular(24),
                      bottomLeft: const Radius.circular(24),
                      bottomRight: const Radius.circular(24),
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: AppTypography.kAppStyle(
                          color: isMe ? AppColors.kWhite : AppColors.kBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 15
                      ),
                      children: [
                        if (highlightedText != null)
                          TextSpan(
                            text: message.split(highlightedText)[0],
                            style: TextStyle(
                                color: isMe ? Colors.white : Colors.black),
                          ),
                        if (highlightedText != null)
                          TextSpan(
                            text: highlightedText,
                            style: AppTypography.kAppStyle(
                                color: AppColors.kOrange,
                                fontWeight: FontWeight.w600,
                                fontSize: 15
                            ), // Highlighted part
                          ),
                        if (highlightedText != null)
                          TextSpan(
                            text: message.split(highlightedText).length > 1
                                ? message.split(highlightedText)[1]
                                : '',
                            style: AppTypography.kAppStyle(
                                color: isMe ? AppColors.kWhite : AppColors.kBlack,
                                fontWeight: FontWeight.w600,
                                fontSize: 15
                            ),
                          ),
                        if (highlightedText == null)
                          TextSpan(
                            text: message,
                            style: AppTypography.kAppStyle(
                              color: isMe ? AppColors.kWhite : AppColors.kBlack,
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isMe && isInfoDataShown) ...[
            const SizedBox(width: 8),
            CircleAvatar(
              backgroundColor: Colors.orange[200],
              radius: 16,
              child: SvgPicture.asset(
                  !isMe ? AppAssets.kAvatar2 : AppAssets.kAvatarPro),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildImageGrid() {
    return Container(
      margin: const EdgeInsets.only(right: 50, bottom: 16),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [
          // Top-left small image
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 0.75,
            child: _buildGridImage(Colors.purple, 63, 63,
                'https://s3-alpha-sig.figma.com/img/66a6/d223/8b5dad02f6c8b72da369438bb48a491c?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CrEnnLTg7658exdSg591n3H52uwCR3XNdKADoxWqJ8iXFDrYCdpQItdHs68Ab3dUNQ-KzpsF5Ik7Gp9v4xf1GfXtuU~JZWMBE9ZIVNeDlN0vogWqBD0Cxr1ofd7rNlNqL-nDTWEAgob8Vg8Qn-nKU65S9KEktSEnaXQzAKOS-mqztrRhnzj5HI2zrJQ5U1os24-Fw93NaKSz8QynJ4OaewLUtTTZPJgtNVsyMn3NxqpfxN2~p7q0zSO0QQSWZ-SAxLpDORhUzfQn3~jJnxd1N6QtUx2F-J5Y1hO46PfiMQyVW3IgFtcaDRWEAzS0FeW4uLg9sNKsyihC2qHvLQhT2Q__'),
          ),
          // Right slightly shorter tall image
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1.5, // reduced height
            child: _buildGridImage(Colors.blue, 130, 130,
                'https://s3-alpha-sig.figma.com/img/f071/2304/9426c414aabdf3d6c57d3a02a9472eee?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=E1BCzleDvxcL1eLbzuu1QIcOR3w9gUTDF1XDUeN9ASGqBuGDfDxXJuWuiMt6aW9n6QxryxRjIkmNFGVE1yEuwrjXjZVxEZhO7Jn2cujo8S-c1U26e3g1vFe4~MtCoL7grxTv98ACVJX2oTR9QNhpBvXJ9EL6Uhqj8MD~7iEc1Hrgf-oiZyQ9nBNG9f0xLBChWhh9QEzmdIz1wnDcxlGaxVCYiFf5bN5-Nzu7t3dfF~38cXjS8ahaxi8QS6gEPkZwgbBfoh3f5UCSqn8-hc0QPBE1bWd9HEXIM~-0FAOoyUxkcVMqGhsbw99mC-S-XumSmDrjiFdCzPWPPh8dXAx9mg__'),
          ),
          // Bottom-left small image
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 0.75,
            child: _buildGridImage(Colors.yellow, 63, 63,
                'https://s3-alpha-sig.figma.com/img/557d/9188/1b63866be7533f48940a81258bad543c?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LQqq1lK45GcJQ7MdHOEZ1AG1rRr5A-D6hx2-kI93-tuGVjM-y5i1zIyy3ZRTVUgO0NBNzwmMXesXOlKVHcaTnt7t0MUnXcRL95guwGFQcj8wwknwsM9QCONHg~cgeAQBbAo63KN3gOQayotDzhVShzEJN2AnP7eCAXZSo~9iwf1mGTFsv2~oCzMIKTxJrBKHJToB~73KrLGqCHUOSiZs2~FF4m0gxx9Yll27BTCxSGHYpilNoJ5xMITvh0Cd11Lnjdd2HYyvEeL~qRWMn7uPYfcEGIUYetfFs63DQ~gJz8XfeqqR-d1m0f~tqqrFl26C8hfNvu2ePE-6~JPA4g7Kgg__'),
          ),
        ],
      ),
    );
  }

  Widget _buildGridImage(
      Color color, double width, double height, String image) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.network(image, fit: BoxFit.cover),
    );
  }

  Widget _buildFileMessage(
      String sender, String time, String fileName, String fileSize,
      {Color? avatarColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: avatarColor,
            radius: 16,
            child: SvgPicture.asset(AppAssets.kAvatar3),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text15(
                      text: sender,
                      style: AppTypography.kAppStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    14.horizontalSpace,
                    Text14(
                      text: time,
                      style: AppTypography.kAppStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        color: AppColors.kGrayText
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.kPDF),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text15(
                              text: fileName,
                              style: AppTypography.kAppStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            Text14(
                              text: fileSize,
                              style: AppTypography.kAppStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kGrayText
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(AppAssets.kDownload),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFEBEEF2), width: 1)),
          child: Row(
            children: [
              CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 16,
                  child: SvgPicture.asset(AppAssets.kAvatarPro)),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  // decoration: BoxDecoration(
                  //   color: const Color(0xFFEBEEF2),
                  //   borderRadius: BorderRadius.circular(14),
                  // ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: AppTypography.kAppStyle(
                              fontWeight: FontWeight.w500, fontSize: 15)
                          .copyWith(color: AppColors.kGrayText),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7FA),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SvgPicture.asset(AppAssets.kSend),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8.0),
          child: Row(children: List.generate(
              3,
                  (index) {
                List<String> images = [
                  AppAssets.kSmile,
                  AppAssets.kAttachment,
                  AppAssets.kImage,
                ];
                      return Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F7FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(images[index]),
                  );
              }
          )),
        )
      ],
    );
  }
}
