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
import 'package:view_finder/core/firebase_module.dart' as _i32;
import 'package:view_finder/data/data_source/calendar_post_data_source.dart'
    as _i10;
import 'package:view_finder/data/data_source/member_data_source.dart' as _i8;
import 'package:view_finder/data/data_source/post_data_source.dart' as _i9;
import 'package:view_finder/data/repository/calendar_post_repository_impl.dart'
    as _i20;
import 'package:view_finder/data/repository/memeber_repository_impl.dart'
    as _i13;
import 'package:view_finder/data/repository/post_repository_impl.dart' as _i17;
import 'package:view_finder/data/services/image_meta_data_service.dart' as _i4;
import 'package:view_finder/data/services/image_upload_service.dart' as _i5;
import 'package:view_finder/data/services/register_check_service.dart' as _i11;
import 'package:view_finder/domain/repository/calendar_post_repository.dart'
    as _i19;
import 'package:view_finder/domain/repository/member_repository.dart' as _i12;
import 'package:view_finder/domain/repository/post_repository.dart' as _i16;
import 'package:view_finder/domain/use_case/get_calendar_post_use_case.dart'
    as _i26;
import 'package:view_finder/domain/use_case/get_member_use_case.dart' as _i15;
import 'package:view_finder/domain/use_case/get_posts_use_case.dart' as _i23;
import 'package:view_finder/domain/use_case/get_user_posts_use_case.dart'
    as _i24;
import 'package:view_finder/domain/use_case/upload_calendar_post_use_case.dart'
    as _i21;
import 'package:view_finder/domain/use_case/upload_member_use_case.dart' as _i7;
import 'package:view_finder/domain/use_case/upload_post_use_case.dart' as _i18;
import 'package:view_finder/domain/utils/fraction_conversion_util.dart' as _i6;
import 'package:view_finder/presentation/auth/member_detail_view_model.dart'
    as _i14;
import 'package:view_finder/presentation/detail_post_screen/detail_post_view_model.dart'
    as _i22;
import 'package:view_finder/presentation/main_screen/account/account_view_model.dart'
    as _i28;
import 'package:view_finder/presentation/main_screen/board/board_view_model.dart'
    as _i30;
import 'package:view_finder/presentation/main_screen/home/home_view_model.dart'
    as _i29;
import 'package:view_finder/presentation/main_screen/photo/photo_tab_view_model.dart'
    as _i31;
import 'package:view_finder/presentation/upload_calendar_post_screen/upload_calendar_post_view_model.dart'
    as _i25;
import 'package:view_finder/presentation/upload_screen/upload_view_model.dart'
    as _i27;

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
    gh.singleton<_i6.FractionConversionUtil>(
        () => _i6.FractionConversionUtil());
    gh.singleton<_i7.UploadMemberUseCase>(() => _i7.UploadMemberUseCase(
        imageUploadService: gh<_i5.ImageUploadService>()));
    gh.singleton<_i8.MemberDataSource>(() =>
        _i8.MemberDataSource(firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i9.PostDataSource>(() =>
        _i9.PostDataSource(firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i10.CalendarPostDataSource>(() => _i10.CalendarPostDataSource(
        firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i11.RegisterCheckService>(() => _i11.RegisterCheckService(
        memberDataSource: gh<_i8.MemberDataSource>()));
    gh.singleton<_i12.MemberRepository>(() => _i13.MemberRepositoryImpl(
        memberDataSource: gh<_i8.MemberDataSource>()));
    gh.factory<_i14.MemberDetailViewModel>(() => _i14.MemberDetailViewModel(
        uploadMemberUseCase: gh<_i7.UploadMemberUseCase>()));
    gh.singleton<_i15.GetMemberUseCase>(() =>
        _i15.GetMemberUseCase(memberRepository: gh<_i12.MemberRepository>()));
    gh.singleton<_i16.PostRepository>(() =>
        _i17.PostRepositoryImpl(postDataSource: gh<_i9.PostDataSource>()));
    gh.singleton<_i18.UploadPostUseCase>(() => _i18.UploadPostUseCase(
          imageUploadService: gh<_i5.ImageUploadService>(),
          getMemberUseCase: gh<_i15.GetMemberUseCase>(),
          imageMetaDataService: gh<_i4.ImageMetaDataService>(),
        ));
    gh.singleton<_i19.CalendarPostRepository>(() =>
        _i20.CalendarPostRepositoryImpl(
            calendarPostDataSource: gh<_i10.CalendarPostDataSource>()));
    gh.singleton<_i21.UploadCalendarPostUseCase>(() =>
        _i21.UploadCalendarPostUseCase(
            getMemberUseCase: gh<_i15.GetMemberUseCase>()));
    gh.factory<_i22.DetailPostViewModel>(() => _i22.DetailPostViewModel(
          getMemberUseCase: gh<_i15.GetMemberUseCase>(),
          fractionConversionService: gh<_i6.FractionConversionUtil>(),
        ));
    gh.singleton<_i23.GetPostsUseCase>(
        () => _i23.GetPostsUseCase(postRepository: gh<_i16.PostRepository>()));
    gh.singleton<_i24.GetUserPostsUseCase>(() =>
        _i24.GetUserPostsUseCase(postRepository: gh<_i16.PostRepository>()));
    gh.factory<_i25.UploadCalendarPostViewModel>(() =>
        _i25.UploadCalendarPostViewModel(
            uploadCalendarPostUseCase: gh<_i21.UploadCalendarPostUseCase>()));
    gh.singleton<_i26.GetCalendarPostUseCase>(() => _i26.GetCalendarPostUseCase(
        calendarPostRepository: gh<_i19.CalendarPostRepository>()));
    gh.factory<_i27.UploadViewModel>(() =>
        _i27.UploadViewModel(uploadPostUseCase: gh<_i18.UploadPostUseCase>()));
    gh.factory<_i28.AccountViewModel>(() => _i28.AccountViewModel(
          getMemberUseCase: gh<_i15.GetMemberUseCase>(),
          getPostsUseCase: gh<_i23.GetPostsUseCase>(),
          getUserPostsUseCase: gh<_i24.GetUserPostsUseCase>(),
        ));
    gh.factory<_i29.HomeViewModel>(() => _i29.HomeViewModel(
          getPostsUseCase: gh<_i23.GetPostsUseCase>(),
          getMemberUseCase: gh<_i15.GetMemberUseCase>(),
          getCalendarPostUseCase: gh<_i26.GetCalendarPostUseCase>(),
        ));
    gh.factory<_i30.BoardViewModel>(() => _i30.BoardViewModel(
          getPostsUseCase: gh<_i23.GetPostsUseCase>(),
          getMemberUseCase: gh<_i15.GetMemberUseCase>(),
        ));
    gh.factory<_i31.PhotoViewModel>(() => _i31.PhotoViewModel(
          getPostsUseCase: gh<_i23.GetPostsUseCase>(),
          getMemberUseCase: gh<_i15.GetMemberUseCase>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i32.FirebaseModule {}
