import 'dart:ui';

abstract class AppConfig {
  // Const and final configuration values (immutable)
  static const Color primaryColor = Color(0xFF5625BA);
  static const Color primaryColorLight = Color(0xFFCCBDEA);
  static const Color secondaryColor = Color(0xFF41a2bc);

  static const Color chatColor = primaryColor;
  static const double messageFontSize = 16.0;
  static const bool allowOtherHomeservers = false;
  static const bool enableRegistration = false;
  static const bool hideTypingUsernames = false;

  static const String inviteLinkPrefix = 'https://matrix.to/#/';
  static const String deepLinkPrefix = 'online.alpakasoft.msg://chat/';
  static const String schemePrefix = 'matrix:';
  static const String pushNotificationsChannelId = 'alpakamsg_push';
  static const String pushNotificationsAppId = 'online.alpakasoft.msg';
  static const double borderRadius = 16.0;
  static const double spaceBorderRadius = 11.0;
  static const double columnWidth = 360.0;

  static const String enablePushTutorial =
      'https://alpakasoft.online/faq/#push';
  static const String encryptionTutorial =
      'https://alpakasoft.online/faq/#encryption';
  static const String startChatTutorial =
      'https://alpakasoft.online/faq/#start_chat';
  static const String howDoIGetStickersTutorial =
      'https://alpakasoft.online/faq/#stickers';
  static const String appId = 'online.alpakasoft.msg';
  static const String appOpenUrlScheme = 'online.alpakasoft.msg';
  static const String appSsoUrlScheme = 'online.alpakasoft.msg.auth';

  static const String sourceCodeUrl =
      'https://alpakasoft.online';
  static const String supportUrl =
      'https://alpakasoft.online/support';
  static const String changelogUrl = 'https://alpakasoft.online/changelog/';

  static const Set<String> defaultReactions = {'👍', '❤️', '😂', '😮', '😢'};

  static final Uri newIssueUrl = Uri(
    scheme: 'https',
    host: 'alpakasoft.online',
    path: '/support',
  );

  static final Uri homeserverList = Uri(
    scheme: 'https',
    host: 'raw.githubusercontent.com',
    path: 'krille-chan/fluffychat/refs/heads/main/recommended_homeservers.json',
  );

  static const String mainIsolatePortName = 'main_isolate';
  static const String pushIsolatePortName = 'push_isolate';
}
