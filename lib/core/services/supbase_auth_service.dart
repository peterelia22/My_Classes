import 'dart:developer';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../errors/exceptions.dart';

class SupabaseAuthService {
  final _auth = Supabase.instance.client.auth;

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response.user!;
    } on AuthException catch (e) {
      log('AuthException in signInWithEmailAndPassword: ${e.message}');
      if (e.message.contains('Invalid login credentials')) {
        throw CustomException(
          message:
              'لا يوجد حساب بهذا البريد الإلكتروني أو كلمة المرور غير صحيحة',
        );
      } else if (e.message.contains('network')) {
        throw CustomException(
          message:
              'لا يوجد اتصال بالإنترنت. يرجى التحقق من اتصالك والمحاولة مرة أخرى',
        );
      } else {
        throw CustomException(
          message:
              ' حدث خطأ غير متوقع أثناء تسجيل الدخول. يرجى المحاولة مرة أخرى',
        );
      }
    } catch (e) {
      log('Exception in signInWithEmailAndPassword: ${e.toString()}');
      throw CustomException(
        message: 'حدث خطأ غير متوقع أثناء تسجيل الدخول. يرجى المحاولة مرة أخرى',
      );
    }
  }

  bool isUserLoggedIn() {
    return _auth.currentUser != null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log('Exception in signOut: ${e.toString()}');
      throw CustomException(message: 'SIGN_OUT_ERROR');
    }
  }
}
