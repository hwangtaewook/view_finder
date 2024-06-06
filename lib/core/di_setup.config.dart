// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:view_finder/core/firebase_module.dart' as _i24;
import 'package:view_finder/data/data_source/member_data_source.dart' as _i6;
import 'package:view_finder/data/data_source/post_data_source.dart' as _i7;
import 'package:view_finder/data/repository/memeber_repository_impl.dart'
    as _i9;
import 'package:view_finder/data/repository/post_repository_impl.dart' as _i13;
import 'package:view_finder/data/services/image_upload_service.dart' as _i4;
import 'package:view_finder/domain/repository/member_repository.dart' as _i8;
import 'package:view_finder/domain/repository/post_repository.dart' as _i12;
import 'package:view_finder/domain/use_case/get_member_use_case.dart' as _i11;
import 'package:view_finder/domain/use_case/get_posts_use_case.dart' as _i16;
import 'package:view_finder/domain/use_case/get_user_posts_use_case.dart'
    as _i17;
import 'package:view_finder/domain/use_case/upload_member_use_case.dart' as _i5;
import 'package:view_finder/domain/use_case/upload_post_use_case.dart' as _i14;
import 'package:view_finder/presentation/auth/member_detail_view_model.dart'
    as _i10;
import 'package:view_finder/presentation/detail_post_screen/detail_post_view_model.dart'
    as _i15;
import 'package:view_finder/presentation/main_screen/account/account_view_model.dart'
    as _i19;
import 'package:view_finder/presentation/main_screen/board/board_view_model.dart'
    as _i21;
import 'package:view_finder/presentation/main_screen/home/home_view_model.dart'
    as _i22;
import 'package:view_finder/presentation/main_screen/main_view_model.dart'
    as _i20;
import 'package:view_finder/presentation/main_screen/photo/photo_tab_view_model.dart'
    as _i23;
import 'package:view_finder/presentation/upload_screen/upload_view_model.dart'
    as _i18;

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
    gh.singleton<_i3.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.singleton<_i4.ImageUploadService>(() => _i4.ImageUploadService());
    gh.singleton<_i5.UploadMemberUseCase>(() => _i5.UploadMemberUseCase(
        imageUploadService: gh<_i4.ImageUploadService>()));
    gh.singleton<_i6.MemberDataSource>(() =>
        _i6.MemberDataSource(firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i7.PostDataSource>(() =>
        _i7.PostDataSource(firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i8.MemberRepository>(() =>
        _i9.MemberRepositoryImpl(memberDataSource: gh<_i6.MemberDataSource>()));
    gh.factory<_i10.MemberDetailViewModel>(() => _i10.MemberDetailViewModel(
        uploadMemberUseCase: gh<_i5.UploadMemberUseCase>()));
    gh.singleton<_i11.GetMemberUseCase>(() =>
        _i11.GetMemberUseCase(memberRepository: gh<_i8.MemberRepository>()));
    gh.singleton<_i12.PostRepository>(() =>
        _i13.PostRepositoryImpl(postDataSource: gh<_i7.PostDataSource>()));
    gh.singleton<_i14.UploadPostUseCase>(() => _i14.UploadPostUseCase(
          imageUploadService: gh<_i4.ImageUploadService>(),
          getMemberUseCase: gh<_i11.GetMemberUseCase>(),
        ));
    gh.factory<_i15.DetailPostViewModel>(() => _i15.DetailPostViewModel(
        getMemberUseCase: gh<_i11.GetMemberUseCase>()));
    gh.singleton<_i16.GetPostsUseCase>(
        () => _i16.GetPostsUseCase(postRepository: gh<_i12.PostRepository>()));
    gh.singleton<_i17.GetUserPostsUseCase>(() =>
        _i17.GetUserPostsUseCase(postRepository: gh<_i12.PostRepository>()));
    gh.factory<_i18.UploadViewModel>(() =>
        _i18.UploadViewModel(uploadPostUseCase: gh<_i14.UploadPostUseCase>()));
    gh.factory<_i19.AccountViewModel>(() => _i19.AccountViewModel(
          getMemberUseCase: gh<_i11.GetMemberUseCase>(),
          getPostsUseCase: gh<_i16.GetPostsUseCase>(),
          getUserPostsUseCase: gh<_i17.GetUserPostsUseCase>(),
        ));
    gh.factory<_i20.MainViewModel>(
        () => _i20.MainViewModel(getPostsUseCase: gh<_i16.GetPostsUseCase>()));
    gh.factory<_i21.BoardViewModel>(() => _i21.BoardViewModel(
          getPostsUseCase: gh<_i16.GetPostsUseCase>(),
          getMemberUseCase: gh<_i11.GetMemberUseCase>(),
        ));
    gh.factory<_i22.HomeViewModel>(() => _i22.HomeViewModel(
          getPostsUseCase: gh<_i16.GetPostsUseCase>(),
          getMemberUseCase: gh<_i11.GetMemberUseCase>(),
        ));
    gh.factory<_i23.PhotoViewModel>(() => _i23.PhotoViewModel(
          getPostsUseCase: gh<_i16.GetPostsUseCase>(),
          getMemberUseCase: gh<_i11.GetMemberUseCase>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i24.FirebaseModule {}
