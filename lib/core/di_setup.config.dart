// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:view_finder/core/firebase_module.dart' as _i16;
import 'package:view_finder/data/data_source/member_data_source.dart' as _i7;
import 'package:view_finder/data/data_source/post_data_source.dart' as _i8;
import 'package:view_finder/data/repository/post_repository_impl.dart' as _i11;
import 'package:view_finder/data/services/image_upload_service.dart' as _i5;
import 'package:view_finder/domain/repository/post_repository.dart' as _i10;
import 'package:view_finder/domain/use_case/get_posts_use_case.dart' as _i12;
import 'package:view_finder/domain/use_case/upload_member_use_case.dart' as _i6;
import 'package:view_finder/presentation/auth/member_detail_view_model.dart'
    as _i9;
import 'package:view_finder/presentation/main_screen/account/account_view_model.dart'
    as _i13;
import 'package:view_finder/presentation/main_screen/home/home_view_model.dart'
    as _i14;
import 'package:view_finder/presentation/main_screen/main_view_model.dart'
    as _i15;
import 'package:view_finder/presentation/upload_screen/upload_view_model.dart'
    as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    gh.factory<_i3.UploadViewModel>(() => _i3.UploadViewModel());
    gh.singleton<_i4.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.singleton<_i5.ImageUploadService>(() => _i5.ImageUploadService());
    gh.singleton<_i6.UploadMemberUseCase>(() => _i6.UploadMemberUseCase(
        imageUploadService: gh<_i5.ImageUploadService>()));
    gh.singleton<_i7.MemberDataSource>(() =>
        _i7.MemberDataSource(firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.singleton<_i8.PostDataSource>(() =>
        _i8.PostDataSource(firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i9.MemberDetailViewModel>(() => _i9.MemberDetailViewModel(
        uploadMemberUseCase: gh<_i6.UploadMemberUseCase>()));
    gh.singleton<_i10.PostRepository>(() =>
        _i11.PostRepositoryImpl(postDataSource: gh<_i8.PostDataSource>()));
    gh.singleton<_i12.GetPostsUseCase>(
        () => _i12.GetPostsUseCase(postRepository: gh<_i10.PostRepository>()));
    gh.factory<_i13.AccountViewModel>(
        () => _i13.AccountViewModel(postRepository: gh<_i10.PostRepository>()));
    gh.factory<_i14.HomeViewModel>(
        () => _i14.HomeViewModel(postRepository: gh<_i10.PostRepository>()));
    gh.factory<_i15.MainViewModel>(
        () => _i15.MainViewModel(getPostsUseCase: gh<_i12.GetPostsUseCase>()));
    return this;
  }
}

class _$FirebaseModule extends _i16.FirebaseModule {}
