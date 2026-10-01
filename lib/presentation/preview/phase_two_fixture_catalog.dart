import 'package:ai_character_chat_mobile/presentation/characters/models/character_creation_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/explore/models/explore_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/messages/models/messages_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/novels/models/novels_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/profile/models/profile_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

abstract final class PhaseTwoFixtureCatalog {
  static const String avatarAsset =
      'assets/images/preview/character_portrait_v2.png';
  static const String storyAsset =
      'assets/images/preview/featured_story_v2.png';
  static const ActionPresentation enabledChat = ActionPresentation(
    label: 'Trò chuyện',
    semanticLabel: 'Bắt đầu trò chuyện',
    state: ActionState.enabled,
  );
  static const ActionPresentation previewAction = ActionPresentation(
    label: 'Xem trước',
    semanticLabel: 'Xem trước giao diện',
    state: ActionState.enabled,
  );
  static const ActionPresentation createAction = ActionPresentation(
    label: 'Tạo nhân vật',
    semanticLabel: 'Mở trình tạo nhân vật',
    state: ActionState.enabled,
  );
  static const ActionPresentation secondaryPreviewAction = ActionPresentation(
    label: 'Khám phá',
    semanticLabel: 'Xem trước nội dung',
    state: ActionState.enabled,
  );
  static const ImagePresentation characterImage = ImagePresentation(
    assetPath: avatarAsset,
    semanticLabel: 'Chân dung nhân vật An',
    state: ImageState.ready,
  );
  static const ImagePresentation storyImage = ImagePresentation(
    assetPath: storyAsset,
    semanticLabel: 'Ảnh bìa Khu vườn ký ức',
    state: ImageState.ready,
  );
  static const CharacterCardPresentation
  featuredCharacter = CharacterCardPresentation(
    id: 'an',
    name: 'An',
    role: 'Người bạn kể chuyện',
    description:
        'Một người bạn dịu dàng, luôn sẵn sàng lắng nghe và cùng bạn viết tiếp những câu chuyện mới.',
    image: characterImage,
    tags: <String>['Ấm áp', 'Kể chuyện', 'Tiếng Việt'],
    metadataLabel: '4.9 · 12.8k lượt trò chuyện',
    statusLabel: 'Đang hoạt động',
    primaryAction: enabledChat,
    secondaryAction: secondaryPreviewAction,
  );
  static const List<CharacterCardPresentation> characters =
      <CharacterCardPresentation>[
        featuredCharacter,
        CharacterCardPresentation(
          id: 'mai',
          name: 'Mai',
          role: 'Nhà thám hiểm',
          description: 'Cùng khám phá những miền đất lạ.',
          image: characterImage,
          tags: <String>['Phiêu lưu'],
          metadataLabel: '4.8 · 8.2k lượt trò chuyện',
          statusLabel: 'Đang hoạt động',
          primaryAction: enabledChat,
          secondaryAction: null,
        ),
        CharacterCardPresentation(
          id: 'linh',
          name: 'Linh',
          role: 'Cố vấn sáng tạo',
          description: 'Gợi mở ý tưởng cho câu chuyện của bạn.',
          image: characterImage,
          tags: <String>['Sáng tạo'],
          metadataLabel: '4.9 · 6.4k lượt trò chuyện',
          statusLabel: 'Đang hoạt động',
          primaryAction: enabledChat,
          secondaryAction: null,
        ),
      ];
  static const AvatarPresentation onlineAvatar = AvatarPresentation(
    image: characterImage,
    initials: 'A',
    semanticLabel: 'An',
    statusLabel: 'Đang trực tuyến',
    statusIntent: StatusIntent.online,
    showStatus: true,
  );
  static const PageHeaderPresentation exploreHeader = PageHeaderPresentation(
    eyebrow: 'AURA AI COMPANION',
    title: 'Chào Kathy',
    subtitle: 'Hôm nay bạn muốn gặp ai?',
    avatar: onlineAvatar,
  );
  static const PageHeaderPresentation messagesHeader = PageHeaderPresentation(
    eyebrow: 'AURA AI COMPANION',
    title: 'Hộp thư',
    subtitle: 'Những câu chuyện đang chờ bạn',
    avatar: onlineAvatar,
  );
  static const PageHeaderPresentation novelsHeader = PageHeaderPresentation(
    eyebrow: 'THẾ GIỚI CỐT TRUYỆN',
    title: 'Tiểu thuyết tương tác',
    subtitle: 'Đắm chìm vào những câu chuyện viết riêng cho bạn',
    avatar: onlineAvatar,
  );
  static const PageHeaderPresentation profileHeader = PageHeaderPresentation(
    eyebrow: 'CÁ NHÂN',
    title: 'Châu Thi',
    subtitle: 'Người kiến tạo thế giới · 3 nhân vật · 2 câu chuyện',
    avatar: onlineAvatar,
  );
  static const List<FilterChipPresentation> messageFilters =
      <FilterChipPresentation>[
        FilterChipPresentation(
          label: 'Tất cả',
          semanticLabel: 'Hiển thị tất cả cuộc trò chuyện',
          selected: true,
          enabled: true,
        ),
        FilterChipPresentation(
          label: 'Yêu thích',
          semanticLabel: 'Hiển thị cuộc trò chuyện yêu thích',
          selected: false,
          enabled: true,
        ),
        FilterChipPresentation(
          label: 'Tự tạo',
          semanticLabel: 'Hiển thị nhân vật tự tạo',
          selected: false,
          enabled: true,
        ),
      ];
  static const List<FilterChipPresentation> exploreFilters =
      <FilterChipPresentation>[
        FilterChipPresentation(
          label: 'Tất cả',
          semanticLabel: 'Hiển thị tất cả nhân vật',
          selected: true,
          enabled: true,
        ),
        FilterChipPresentation(
          label: 'Bạn tâm sự',
          semanticLabel: 'Lọc nhân vật bạn tâm sự',
          selected: false,
          enabled: true,
        ),
        FilterChipPresentation(
          label: 'Phiêu lưu',
          semanticLabel: 'Lọc nhân vật phiêu lưu',
          selected: false,
          enabled: true,
        ),
      ];
  static const List<FilterChipPresentation> novelCategories =
      <FilterChipPresentation>[
        FilterChipPresentation(
          label: 'Tất cả',
          semanticLabel: 'Hiển thị tất cả tiểu thuyết',
          selected: true,
          enabled: true,
        ),
        FilterChipPresentation(
          label: 'Ngôn tình đô thị',
          semanticLabel: 'Lọc tiểu thuyết ngôn tình đô thị',
          selected: false,
          enabled: true,
        ),
        FilterChipPresentation(
          label: 'Giả tưởng',
          semanticLabel: 'Lọc tiểu thuyết giả tưởng',
          selected: false,
          enabled: true,
        ),
      ];
  static const List<FilterChipPresentation> profileSegments =
      <FilterChipPresentation>[
        FilterChipPresentation(
          label: 'Nhân vật của tôi',
          semanticLabel: 'Hiển thị nhân vật của tôi',
          selected: true,
          enabled: true,
        ),
        FilterChipPresentation(
          label: 'Yêu thích',
          semanticLabel: 'Hiển thị nhân vật yêu thích',
          selected: false,
          enabled: true,
        ),
      ];
  static const List<MetricPresentation> profileMetrics = <MetricPresentation>[
    MetricPresentation(
      value: '640',
      label: 'Kim cương',
      supportingLabel: null,
      icon: Icons.auto_awesome_outlined,
    ),
    MetricPresentation(
      value: '28',
      label: 'Lượt tạo ảnh',
      supportingLabel: null,
      icon: Icons.image_outlined,
    ),
    MetricPresentation(
      value: '45p',
      label: 'Thoại AI',
      supportingLabel: null,
      icon: Icons.mic_none_outlined,
    ),
  ];
  static const SectionPresentation featuredCharacterSection =
      SectionPresentation(
        title: 'Dành riêng cho bạn',
        subtitle: 'Nhân vật nổi bật hôm nay',
        trailingAction: null,
      );
  static const SectionPresentation recommendationSection = SectionPresentation(
    title: 'Gợi ý theo gu',
    subtitle: 'Những người bạn có thể hợp với bạn',
    trailingAction: null,
  );
  static const SectionPresentation popularCharacterSection =
      SectionPresentation(
        title: 'Được yêu thích',
        subtitle: 'Những câu chuyện được ghé thăm nhiều',
        trailingAction: secondaryPreviewAction,
      );
  static const SectionPresentation onlineSection = SectionPresentation(
    title: 'Đang hoạt động',
    subtitle: '4 bạn online',
    trailingAction: null,
  );
  static const SectionPresentation conversationSection = SectionPresentation(
    title: 'Cuộc trò chuyện',
    subtitle: 'Tin nhắn gần đây',
    trailingAction: null,
  );
  static const SectionPresentation featuredNovelSection = SectionPresentation(
    title: 'Tiểu thuyết nổi bật',
    subtitle: 'Tập mới hôm nay',
    trailingAction: null,
  );
  static const SectionPresentation storyCharacterSection = SectionPresentation(
    title: 'Nhân vật trong truyện',
    subtitle: 'Gặp gỡ những người đồng hành',
    trailingAction: null,
  );
  static const SectionPresentation trendingNovelSection = SectionPresentation(
    title: 'Tiểu thuyết thịnh hành',
    subtitle: 'Được đọc nhiều trong tuần',
    trailingAction: secondaryPreviewAction,
  );
  static const SectionPresentation ownedCharacterSection = SectionPresentation(
    title: 'Nhân vật của bạn',
    subtitle: 'Quản lý các nhân vật đã tạo',
    trailingAction: createAction,
  );
  static const SectionPresentation accountSection = SectionPresentation(
    title: 'Trải nghiệm & Tài khoản',
    subtitle: null,
    trailingAction: null,
  );
  static const CalloutPresentation creationCallout = CalloutPresentation(
    eyebrow: 'STUDIO SÁNG TẠO',
    title: 'Tự tạo người bạn lý tưởng',
    body: 'Biến một ý tưởng nhỏ thành nhân vật có câu chuyện riêng.',
    action: createAction,
  );
  static const CalloutPresentation conversationSuggestion = CalloutPresentation(
    eyebrow: 'ĐỀ XUẤT TUẦN NÀY',
    title: 'Gặp gỡ một người bạn mới',
    body: 'Thử một câu chuyện mới để mở rộng thế giới của bạn.',
    action: secondaryPreviewAction,
  );
  static const CalloutPresentation roleplayCallout = CalloutPresentation(
    eyebrow: 'SẮP RA MẮT',
    title: 'Nhập vai cùng nhân vật',
    body: 'Gặp nhân vật trong câu chuyện và cùng họ viết tiếp diễn biến.',
    action: previewAction,
  );
  static const CalloutPresentation creatorCallout = CalloutPresentation(
    eyebrow: 'STUDIO SÁNG TẠO',
    title: 'Trung tâm Nhà sáng tạo',
    body: 'Quản lý persona AI, theo dõi lượt trò chuyện và nhận quà.',
    action: previewAction,
  );
  static const List<MenuItemPresentation> accountItems = <MenuItemPresentation>[
    MenuItemPresentation(
      title: 'Tùy chọn giọng nói AI',
      subtitle: 'Giọng đọc tự nhiên, ngôn ngữ và tốc độ',
      trailingLabel: 'Nữ miền Bắc',
      icon: Icons.record_voice_over_outlined,
    ),
    MenuItemPresentation(
      title: 'An toàn nội dung & Độ tuổi',
      subtitle: 'Bộ lọc nhạy cảm và bảo mật ngữ cảnh',
      trailingLabel: 'Thiếu niên',
      icon: Icons.shield_outlined,
    ),
    MenuItemPresentation(
      title: 'Trợ giúp & Góp ý',
      subtitle: 'Hướng dẫn tạo persona và báo lỗi',
      trailingLabel: null,
      icon: Icons.help_outline,
    ),
  ];
  static const List<ConversationPresentation> conversations =
      <ConversationPresentation>[
        ConversationPresentation(
          id: 'conversation-an',
          name: 'An',
          preview: 'Mình tiếp tục câu chuyện tối qua nhé?',
          timeLabel: '09:42',
          statusLabel: '1 tin nhắn chưa đọc',
          relationshipLabel: 'Bạn tâm sự',
          mediaLabel: 'Tin nhắn',
          avatar: onlineAvatar,
          unreadCount: 1,
          pinned: true,
        ),
        ConversationPresentation(
          id: 'conversation-mai',
          name: 'Mai',
          preview: 'Chuyến đi tiếp theo sẽ bắt đầu ở đâu?',
          timeLabel: 'Hôm qua',
          statusLabel: 'Đã đọc',
          relationshipLabel: 'Bạn đồng hành',
          mediaLabel: null,
          avatar: onlineAvatar,
          unreadCount: 0,
          pinned: false,
        ),
      ];
  static const NovelCardPresentation featuredNovel = NovelCardPresentation(
    id: 'memory-garden',
    title: 'Khu vườn ký ức',
    author: 'Terra Studio',
    summary:
        'Mỗi lựa chọn mở ra một lối đi khác giữa khu vườn nơi ký ức biết lên tiếng.',
    progressLabel: 'Chương 3 · 35%',
    image: storyImage,
    tags: <String>['Ngôn tình', '12 chương'],
    readerLabel: '1.2M lượt đọc',
    bookmarkLabel: 'Đã lưu',
    action: previewAction,
    secondaryAction: enabledChat,
  );
  static const List<NovelCardPresentation> novels = <NovelCardPresentation>[
    featuredNovel,
    NovelCardPresentation(
      id: 'moon-letter',
      title: 'Lá thư dưới trăng',
      author: 'Terra Studio',
      summary: 'Một bức thư thất lạc nối hai thế giới.',
      progressLabel: null,
      image: storyImage,
      tags: <String>['Giả tưởng'],
      readerLabel: '780k lượt đọc',
      bookmarkLabel: null,
      action: previewAction,
      secondaryAction: null,
    ),
  ];
  static const ExplorePresentation explore = ExplorePresentation(
    header: exploreHeader,
    search: InputPresentation(
      label: 'Tìm kiếm',
      hint: 'Tìm nhân vật hoặc câu chuyện',
      value: '',
      errorText: null,
      helperText: null,
      countLabel: null,
      enabled: true,
      readOnly: false,
    ),
    filters: exploreFilters,
    featuredSection: featuredCharacterSection,
    featured: featuredCharacter,
    recommendedSection: recommendationSection,
    recommended: characters,
    creationCallout: creationCallout,
    popularSection: popularCharacterSection,
    popular: characters,
  );
  static const MessagesPresentation messages = MessagesPresentation(
    header: messagesHeader,
    search: InputPresentation(
      label: 'Tìm kiếm',
      hint: 'Tìm kiếm một cuộc trò chuyện hoặc bạn bè',
      value: '',
      errorText: null,
      helperText: null,
      countLabel: null,
      enabled: true,
      readOnly: false,
    ),
    onlineSection: onlineSection,
    onlineAvatars: <AvatarPresentation>[
      onlineAvatar,
      onlineAvatar,
      onlineAvatar,
      onlineAvatar,
    ],
    filters: messageFilters,
    conversationSection: conversationSection,
    conversations: conversations,
    suggestion: conversationSuggestion,
  );
  static const NovelsPresentation novelsPresentation = NovelsPresentation(
    header: novelsHeader,
    search: InputPresentation(
      label: 'Tìm kiếm',
      hint: 'Tìm tác phẩm, tác giả hoặc vũ trụ',
      value: '',
      errorText: null,
      helperText: null,
      countLabel: null,
      enabled: true,
      readOnly: false,
    ),
    categories: novelCategories,
    featuredSection: featuredNovelSection,
    featured: featuredNovel,
    storyCharacterSection: storyCharacterSection,
    storyCharacters: <AvatarPresentation>[onlineAvatar, onlineAvatar],
    roleplayCallout: roleplayCallout,
    trendingSection: trendingNovelSection,
    trending: novels,
  );
  static const ProfilePresentation profile = ProfilePresentation(
    header: profileHeader,
    metrics: profileMetrics,
    creatorCallout: creatorCallout,
    segments: profileSegments,
    characterSection: ownedCharacterSection,
    characters: characters,
    accountSection: accountSection,
    accountItems: accountItems,
  );
  static const CharacterCreationPresentation
  characterCreation = CharacterCreationPresentation(
    imageSection: NumberedSectionPresentation(
      number: '01',
      title: 'Hình ảnh đại diện',
      subtitle: 'Chọn hình ảnh thể hiện rõ nhất nhân vật của bạn',
    ),
    image: characterImage,
    generateImage: ActionPresentation(
      label: 'Tạo bằng AI',
      semanticLabel: 'Xem trước thao tác tạo ảnh bằng AI',
      state: ActionState.enabled,
    ),
    uploadImage: ActionPresentation(
      label: 'Tải từ máy',
      semanticLabel: 'Xem trước thao tác tải ảnh từ máy',
      state: ActionState.enabled,
    ),
    basicSection: NumberedSectionPresentation(
      number: '02',
      title: 'Thông tin cốt lõi',
      subtitle: 'Đặt tên và xác định vai trò của nhân vật',
    ),
    name: InputPresentation(
      label: 'Tên nhân vật',
      hint: 'Ví dụ: Aria, Hạo Nhiên, Kathy',
      value: '',
      errorText: null,
      helperText: null,
      countLabel: null,
      enabled: true,
      readOnly: false,
    ),
    role: InputPresentation(
      label: 'Vai trò',
      hint: 'Ví dụ: người bạn kể chuyện',
      value: '',
      errorText: null,
      helperText: null,
      countLabel: null,
      enabled: true,
      readOnly: false,
    ),
    personalitySection: NumberedSectionPresentation(
      number: '03',
      title: 'Tính cách & Sắc thái trò chuyện',
      subtitle: 'Chọn các nét tính cách hiển thị trong hội thoại',
    ),
    relationshipLabel: 'Mối quan hệ & Vai trò',
    relationships: <FilterChipPresentation>[
      FilterChipPresentation(
        label: 'Bạn thân tri kỷ',
        semanticLabel: 'Vai trò bạn thân tri kỷ',
        selected: true,
        enabled: true,
      ),
      FilterChipPresentation(
        label: 'Người yêu ảo',
        semanticLabel: 'Vai trò người yêu ảo',
        selected: false,
        enabled: true,
      ),
    ],
    personalityLabel: 'Nét tính cách nổi bật',
    personalities: <FilterChipPresentation>[
      FilterChipPresentation(
        label: 'Chu đáo',
        semanticLabel: 'Tính cách chu đáo',
        selected: true,
        enabled: true,
      ),
      FilterChipPresentation(
        label: 'Hài hước',
        semanticLabel: 'Tính cách hài hước',
        selected: false,
        enabled: true,
      ),
      FilterChipPresentation(
        label: 'Điềm tĩnh',
        semanticLabel: 'Tính cách điềm tĩnh',
        selected: false,
        enabled: true,
      ),
    ],
    contextSection: NumberedSectionPresentation(
      number: '04',
      title: 'Cốt truyện & Lời chào',
      subtitle: 'Đặt bối cảnh và cách nhân vật bắt đầu cuộc trò chuyện',
    ),
    prompt: InputPresentation(
      label: 'Tính cách và bối cảnh',
      hint: 'Mô tả người bạn bạn muốn gặp',
      value: '',
      errorText: null,
      helperText: null,
      countLabel: '0 / 500',
      enabled: true,
      readOnly: false,
    ),
    greeting: InputPresentation(
      label: 'Lời chào đầu tiên',
      hint: 'Viết câu mở đầu của nhân vật',
      value: '',
      errorText: null,
      helperText: 'Nội dung chỉ dùng cho bản xem trước Phase 2.',
      countLabel: '0 / 200',
      enabled: true,
      readOnly: false,
    ),
    submit: ActionPresentation(
      label: 'Hoàn tất & Khởi tạo nhân vật',
      semanticLabel: 'Xem trước bước hoàn tất tạo nhân vật',
      state: ActionState.disabled,
    ),
    notice:
        'Thiết lập này chỉ là bản xem trước giao diện, chưa tạo dữ liệu thật.',
  );
  static const EmptyPresentation productionEmpty = EmptyPresentation(
    title: 'Nội dung đang được chuẩn bị',
    message: 'Dữ liệu thật sẽ được kết nối ở giai đoạn tiếp theo.',
    action: null,
  );
}
