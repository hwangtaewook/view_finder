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
import 'package:view_finder/core/firebase_module.dart' as _i21;
import 'package:view_finder/data/data_source/member_data_source.dart' as _i7;
import 'package:view_finder/data/data_source/post_data_source.dart' as _i8;
import 'package:view_finder/data/repository/memeber_repository_impl.dart'
    as _i10;
import 'package:view_finder/data/repository/post_repository_impl.dart' as _i14;
import 'package:view_finder/data/services/image_upload_service.dart' as _i5;
import 'package:view_finder/domain/repository/member_repository.dart' as _i9;
import 'package:view_finder/domain/repository/post_repository.dart' as _i13;
import 'package:view_finder/domain/use_case/get_member_use_case.dart' as _i12;
import 'package:view_finder/domain/use_case/get_posts_use_case.dart' as _i15;
import 'package:view_finder/domain/use_case/upload_member_use_case.dart' as _i6;
import 'package:view_finder/presentation/auth/member_detail_view_model.dart'
    as _i11;
import 'package:view_finder/presentation/main_screen/account/account_view_model.dart'
    as _i16;
import 'package:view_finder/presentation/main_screen/board/board_view_model.dart'
    as _i20;
import 'package:view_finder/presentation/main_screen/home/home_view_model.dart'
    as _i18;
import 'package:view_finder/presentation/main_screen/main_view_model.dart'
    as _i17;
import 'package:view_finder/presentation/main_screen/photo/photo_tab_view_model.dart'
    as _i19;
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
    gh.singleton<_i9.MemberRepository>(() => _i10.MemberRepositoryImpl(
        memberDataSource: gh<_i7.MemberDataSource>()));
    gh.factory<_i11.MemberDetailViewModel>(() => _i11.MemberDetailViewModel(
        uploadMemberUseCase: gh<_i6.UploadMemberUseCase>()));
    gh.singleton<_i12.GetMemberUseCase>(() =>
        _i12.GetMemberUseCase(memberRepository: gh<_i9.MemberRepository>()));
    gh.singleton<_i13.PostRepository>(() =>
        _i14.PostRepositoryImpl(postDataSource: gh<_i8.PostDataSource>()));
    gh.singleton<_i15.GetPostsUseCase>(
        () => _i15.GetPostsUseCase(postRepository: gh<_i13.PostRepository>()));
    gh.factory<_i16.AccountViewModel>(() => _i16.AccountViewModel(
          getMemberUseCase: gh<_i12.GetMemberUseCase>(),
          getPostsUseCase: gh<_i15.GetPostsUseCase>(),
        ));
    gh.factory<_i17.MainViewModel>(
        () => _i17.MainViewModel(getPostsUseCase: gh<_i15.GetPostsUseCase>()));
    gh.factory<_i18.HomeViewModel>(() => _i18.HomeViewModel(
          getPostsUseCase: gh<_i15.GetPostsUseCase>(),
          getMemberUseCase: gh<_i12.GetMemberUseCase>(),
        ));
    gh.factory<_i19.PhotoViewModel>(() => _i19.PhotoViewModel(
          getPostsUseCase: gh<_i15.GetPostsUseCase>(),
          getMemberUseCase: gh<_i12.GetMemberUseCase>(),
        ));
    gh.factory<_i20.BoardViewModel>(() => _i20.BoardViewModel(
          getPostsUseCase: gh<_i15.GetPostsUseCase>(),
          getMemberUseCase: gh<_i12.GetMemberUseCase>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i21.FirebaseModule {}
