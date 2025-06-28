import '../entities/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> signInWithEmailPassword(String email, String password);
  Future<AuthEntity> signUpWithEmailPassword(String email, String password);
  Future<void> signOut();
}
