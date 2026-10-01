// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "texts": {
    "notification": "Notification",
    "success": "Success",
    "error_occur": "An error has occurred, please try again later",
    "email_address": "Email Address",
    "password": "Password"
  },
  "button": {
    "cancel": "Cancel",
    "confirm": "Confirm",
    "try_again": "Try again"
  },
  "root": {
    "home": "Explore",
    "explore": "Explore",
    "messages": "Messages",
    "novels": "Novels",
    "profile": "Profile",
    "management": "Management"
  },
  "terra": {
    "create_character": "Create character",
    "character_detail": "Character details",
    "chat": "Chat",
    "novel_reader": "Novel reader",
    "search": "Search",
    "filter": "Filter",
    "clear": "Clear text",
    "loading": "Loading",
    "empty": "No content yet",
    "error": "Content could not be loaded",
    "retry": "Try again",
    "image_unavailable": "Image unavailable",
    "online": "Online",
    "preview": "Preview content",
    "preview_notice": "Actions on this screen are for interface preview only.",
    "back": "Back",
    "close": "Close"
  },
  "auth": {
    "welcome_back": "Nice to have you back!",
    "sign_in": "Sign in"
  },
  "validator": {
    "email_required": "Please enter your email",
    "password_required": "Please enter your password",
    "invalid_email": "Invalid email address",
    "incorrect_email_password": "Incorrect email or password",
    "invalid_password": "Password must be at least 8 characters",
    "field_required": "This field is required",
    "not_match_password": "Password and confirm password not match"
  },
  "loading": {
    "ads": "Loading ads..."
  }
};
static const Map<String,dynamic> _vi = {
  "texts": {
    "notification": "Thông báo",
    "success": "Thành công",
    "error_occur": "Đã có lỗi xảy ra, vui lòng thử lại sau",
    "email_address": "Email",
    "password": "Mật khẩu"
  },
  "button": {
    "cancel": "Hủy",
    "confirm": "Xác nhận",
    "try_again": "Thử lại"
  },
  "root": {
    "home": "Khám phá",
    "explore": "Khám phá",
    "messages": "Tin nhắn",
    "novels": "Tiểu thuyết",
    "profile": "Cá nhân",
    "management": "Quản lý"
  },
  "terra": {
    "create_character": "Tạo nhân vật",
    "character_detail": "Chi tiết nhân vật",
    "chat": "Trò chuyện",
    "novel_reader": "Đọc tiểu thuyết",
    "search": "Tìm kiếm",
    "filter": "Bộ lọc",
    "clear": "Xóa nội dung",
    "loading": "Đang tải",
    "empty": "Chưa có nội dung",
    "error": "Không thể tải nội dung",
    "retry": "Thử lại",
    "image_unavailable": "Không có hình ảnh",
    "online": "Đang trực tuyến",
    "preview": "Nội dung xem trước",
    "preview_notice": "Các thao tác ở màn hình này chỉ dùng để xem trước giao diện.",
    "back": "Quay lại",
    "close": "Đóng"
  },
  "auth": {
    "welcome_back": "Rất vui khi được gặp lại bạn!",
    "sign_in": "Đăng nhập"
  },
  "validator": {
    "email_required": "Vui lòng nhập email",
    "password_required": "Vui lòng nhập mật khẩu",
    "invalid_email": "Không đúng định dạng email",
    "incorrect_email_password": "Email hoặc mật khẩu không đúng",
    "invalid_password": "Mật khẩu phải có ít nhất 8 kí tự",
    "field_required": "Không được để trống",
    "not_match_password": "Mật khẩu xác nhận không trùng khớp"
  },
  "loading": {
    "ads": "Đang tải quảng cáo..."
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "vi": _vi};
}
