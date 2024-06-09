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
import 'package:view_finder/core/firebase_module.dart' as _i26;
import 'package:view_finder/data/data_source/member_data_source.dart' as _i8;
import 'package:view_finder/data/data_source/post_data_source.dart' as _i9;
import 'package:view_finder/data/repository/memeber_repository_impl.dart'
    as _i12;
import 'package:view_finder/data/repository/post_repository_impl.dart' as _i16;
import 'package:view_finder/data/services/fraction_conversion_service.dart'
    as _i6;
import 'package:view_finder/data/services/image_meta_data_service.dart' as _i4;
import 'package:view_finder/data/services/image_upload_service.dart' as _i5;
import 'package:view_finder/data/services/register_check_service.dart' as _i10;
import 'package:view_finder/domain/repository/member_repository.dart' as _i11;
import 'package:view_finder/domain/repository/post_repository.dart' as _i15;
import 'package:view_finder/domain/use_case/get_member_use_case.dart' as _i14;
import 'package:view_finder/domain/use_case/get_posts_use_case.dart' as _i19;
import 'package:view_finder/domain/use_case/get_user_posts_use_case.dart'
    as _i20;
import 'package:view_finder/domain/use_case/upload_member_use_case.dart' as _i7;
import 'package:view_finder/domain/use_case/upload_post_use_case.dart' as _i17;
import 'package:view_finder/presentation/auth/member_detail_view_model.dart'
    as _i13;
import 'package:view_finder/presentation/detail_post_screen/detail_post_view_model.dart'
    as _i18;
import 'package:view_finder/presentation/main_screen/account/account_view_model.dart'
    as _i22;
import 'package:view_finder/presentation/main_screen/board/board_view_model.dart'
    as _i23;
import 'package:view_finder/presentation/main_screen/home/home_view_model.dart'
    as _i24;
import 'package:view_finder/presentation/main_screen/photo/photo_tab_view_model.dart'
    as _i25;
import 'package:view_finder/presentation/upload_screen/upload_view_model.dart'
    as _i21;

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
    gh.singleton<_i4.ImageMetaDataService>(() => _i4.ImageMetaDataService());
    gh.singleton<_i5.ImageUploadService>(() => _i5.ImageUploadService());
    gh.singleton<_i6.FractionConversionService>(
        () => _i6.FractionConversionService());
    gh.singleton<_i7.UploadMemberUseCase>(() => _i7.UploadMemberUseCase(
        imageUploadService: gh<_i5.ImageUploadService>()));
    gh.singleton<_i8.MemberDataSource>(() =>
        _i8.MemberDataSource(firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i9.PostDataSource>(() =>
        _i9.PostDataSource(firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i10.RegisterCheckService>(() => _i10.RegisterCheckService(
        memberDataSource: gh<_i8.MemberDataSource>()));
    gh.singleton<_i11.MemberRepository>(() => _i12.MemberRepositoryImpl(
        memberDataSource: gh<_i8.MemberDataSource>()));
    gh.factory<_i13.MemberDetailViewModel>(() => _i13.MemberDetailViewModel(
        uploadMemberUseCase: gh<_i7.UploadMemberUseCase>()));
    gh.singleton<_i14.GetMemberUseCase>(() =>
        _i14.GetMemberUseCase(memberRepository: gh<_i11.MemberRepository>()));
    gh.singleton<_i15.PostRepository>(() =>
        _i16.PostRepositoryImpl(postDataSource: gh<_i9.PostDataSource>()));
    gh.singleton<_i17.UploadPostUseCase>(() => _i17.UploadPostUseCase(
          imageUploadService: gh<_i5.ImageUploadService>(),
          getMemberUseCase: gh<_i14.GetMemberUseCase>(),
          imageMetaDataService: gh<_i4.ImageMetaDataService>(),
        ));
    gh.factory<_i18.DetailPostViewModel>(() => _i18.DetailPostViewModel(
          getMemberUseCase: gh<_i14.GetMemberUseCase>(),
          fractionConversionService: gh<_i6.FractionConversionService>(),
        ));
    gh.singleton<_i19.GetPostsUseCase>(
        () => _i19.GetPostsUseCase(postRepository: gh<_i15.PostRepository>()));
    gh.singleton<_i20.GetUserPostsUseCase>(() =>
        _i20.GetUserPostsUseCase(postRepository: gh<_i15.PostRepository>()));
    gh.factory<_i21.UploadViewModel>(() =>
        _i21.UploadViewModel(uploadPostUseCase: gh<_i17.UploadPostUseCase>()));
    gh.factory<_i22.AccountViewModel>(() => _i22.AccountViewModel(
          getMemberUseCase: gh<_i14.GetMemberUseCase>(),
          getPostsUseCase: gh<_i19.GetPostsUseCase>(),
          getUserPostsUseCase: gh<_i20.GetUserPostsUseCase>(),
        ));
    gh.factory<_i23.BoardViewModel>(() => _i23.BoardViewModel(
          getPostsUseCase: gh<_i19.GetPostsUseCase>(),
          getMemberUseCase: gh<_i14.GetMemberUseCase>(),
        ));
    gh.factory<_i24.HomeViewModel>(() => _i24.HomeViewModel(
          getPostsUseCase: gh<_i19.GetPostsUseCase>(),
          getMemberUseCase: gh<_i14.GetMemberUseCase>(),
        ));
    gh.factory<_i25.PhotoViewModel>(() => _i25.PhotoViewModel(
          getPostsUseCase: gh<_i19.GetPostsUseCase>(),
          getMemberUseCase: gh<_i14.GetMemberUseCase>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i26.FirebaseModule {}
