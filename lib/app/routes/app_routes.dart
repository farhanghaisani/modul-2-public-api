part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const HTTP = _Paths.HTTP;
  static const WEBVIEW = _Paths.WEBVIEW;
  static const ARTICLE_DETAILS = _Paths.ARTICLE_DETAILS;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const HTTP = '/http';
  static const WEBVIEW = '/webview';
  static const ARTICLE_DETAILS = '/article-details';
}
