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
import 'package:view_finder/core/firebase_module.dart' as _i38;
import 'package:view_finder/data/data_source/announcement_post_data_source.dart'
    as _i8;
import 'package:view_finder/data/data_source/calendar_post_data_source.dart'
    as _i9;
import 'package:view_finder/data/data_source/member_data_source.dart' as _i10;
import 'package:view_finder/data/data_source/post_data_source.dart' as _i11;
import 'package:view_finder/data/repository/announcement_post_repository_impl.dart'
    as _i14;
import 'package:view_finder/data/repository/calendar_post_repository_impl.dart'
    as _i23;
import 'package:view_finder/data/repository/memeber_repository_impl.dart'
    as _i16;
import 'package:view_finder/data/repository/post_repository_impl.dart' as _i20;
import 'package:view_finder/data/services/image_meta_data_service.dart' as _i4;
import 'package:view_finder/data/services/image_upload_service.dart' as _i5;
import 'package:view_finder/data/services/register_check_service.dart' as _i12;
import 'package:view_finder/domain/repository/announcement_post_repository.dart'
    as _i13;
import 'package:view_finder/domain/repository/calendar_post_repository.dart'
    as _i22;
import 'package:view_finder/domain/repository/member_repository.dart' as _i15;
import 'package:view_finder/domain/repository/post_repository.dart' as _i19;
import 'package:view_finder/domain/use_case/get_announcement_post_use_case.dart'
    as _i27;
import 'package:view_finder/domain/use_case/get_calendar_post_use_case.dart'
    as _i32;
import 'package:view_finder/domain/use_case/get_member_use_case.dart' as _i18;
import 'package:view_finder/domain/use_case/get_posts_use_case.dart' as _i28;
import 'package:view_finder/domain/use_case/get_user_posts_use_case.dart'
    as _i29;
import 'package:view_finder/domain/use_case/upload_announcement_post_use_case.dart'
    as _i24;
import 'package:view_finder/domain/use_case/upload_calendar_post_use_case.dart'
    as _i25;
import 'package:view_finder/domain/use_case/upload_member_use_case.dart' as _i7;
import 'package:view_finder/domain/use_case/upload_post_use_case.dart' as _i21;
import 'package:view_finder/domain/utils/fraction_conversion_util.dart' as _i6;
import 'package:view_finder/presentation/auth/member_detail_view_model.dart'
    as _i17;
import 'package:view_finder/presentation/detail_post_screen/detail_post_view_model.dart'
    as _i26;
import 'package:view_finder/presentation/main_screen/account/account_view_model.dart'
    as _i35;
import 'package:view_finder/presentation/main_screen/board/board_view_model.dart'
    as _i33;
import 'package:view_finder/presentation/main_screen/home/home_view_model.dart'
    as _i36;
import 'package:view_finder/presentation/main_screen/photo/photo_tab_view_model.dart'
    as _i37;
import 'package:view_finder/presentation/upload_announcement_post_screen/upload_announcement_post_view_model.dart'
    as _i30;
import 'package:view_finder/presentation/upload_calendar_post_screen/upload_calendar_post_view_model.dart'
    as _i31;
import 'package:view_finder/presentation/upload_screen/upload_view_model.dart'
    as _i34;

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
    gh.singleton<_i8.AnnouncementPostDataSource>(() =>
        _i8.AnnouncementPostDataSource(
            firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i9.CalendarPostDataSource>(() => _i9.CalendarPostDataSource(
        firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i10.MemberDataSource>(() =>
        _i10.MemberDataSource(firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i11.PostDataSource>(() =>
        _i11.PostDataSource(firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i12.RegisterCheckService>(() => _i12.RegisterCheckService(
        memberDataSource: gh<_i10.MemberDataSource>()));
    gh.singleton<_i13.AnnouncementPostRepository>(() =>
        _i14.AnnouncementPostRepositoryImpl(
            announcementPostDatSoucre: gh<_i8.AnnouncementPostDataSource>()));
    gh.singleton<_i15.MemberRepository>(() => _i16.MemberRepositoryImpl(
        memberDataSource: gh<_i10.MemberDataSource>()));
    gh.factory<_i17.MemberDetailViewModel>(() => _i17.MemberDetailViewModel(
        uploadMemberUseCase: gh<_i7.UploadMemberUseCase>()));
    gh.singleton<_i18.GetMemberUseCase>(() =>
        _i18.GetMemberUseCase(memberRepository: gh<_i15.MemberRepository>()));
    gh.singleton<_i19.PostRepository>(() =>
        _i20.PostRepositoryImpl(postDataSource: gh<_i11.PostDataSource>()));
    gh.singleton<_i21.UploadPostUseCase>(() => _i21.UploadPostUseCase(
          imageUploadService: gh<_i5.ImageUploadService>(),
          getMemberUseCase: gh<_i18.GetMemberUseCase>(),
          imageMetaDataService: gh<_i4.ImageMetaDataService>(),
        ));
    gh.singleton<_i22.CalendarPostRepository>(() =>
        _i23.CalendarPostRepositoryImpl(
            calendarPostDataSource: gh<_i9.CalendarPostDataSource>()));
    gh.singleton<_i24.UploadAnnouncementPostUseCase>(() =>
        _i24.UploadAnnouncementPostUseCase(
            getMemberUseCase: gh<_i18.GetMemberUseCase>()));
    gh.singleton<_i25.UploadCalendarPostUseCase>(() =>
        _i25.UploadCalendarPostUseCase(
            getMemberUseCase: gh<_i18.GetMemberUseCase>()));
    gh.factory<_i26.DetailPostViewModel>(() => _i26.DetailPostViewModel(
          getMemberUseCase: gh<_i18.GetMemberUseCase>(),
          fractionConversionService: gh<_i6.FractionConversionUtil>(),
        ));
    gh.singleton<_i27.GetAnnouncementPostUseCase>(() =>
        _i27.GetAnnouncementPostUseCase(
            announcementPostRepository: gh<_i13.AnnouncementPostRepository>()));
    gh.singleton<_i28.GetPostsUseCase>(
        () => _i28.GetPostsUseCase(postRepository: gh<_i19.PostRepository>()));
    gh.singleton<_i29.GetUserPostsUseCase>(() =>
        _i29.GetUserPostsUseCase(postRepository: gh<_i19.PostRepository>()));
    gh.factory<_i30.UploadAnnouncementPostViewModel>(() =>
        _i30.UploadAnnouncementPostViewModel(
            uploadAnnouncementPostUseCase:
                gh<_i24.UploadAnnouncementPostUseCase>()));
    gh.factory<_i31.UploadCalendarPostViewModel>(() =>
        _i31.UploadCalendarPostViewModel(
            uploadCalendarPostUseCase: gh<_i25.UploadCalendarPostUseCase>()));
    gh.singleton<_i32.GetCalendarPostUseCase>(() => _i32.GetCalendarPostUseCase(
        calendarPostRepository: gh<_i22.CalendarPostRepository>()));
    gh.factory<_i33.BoardViewModel>(() => _i33.BoardViewModel(
          getPostsUseCase: gh<_i28.GetPostsUseCase>(),
          getMemberUseCase: gh<_i18.GetMemberUseCase>(),
          getAnnouncementPostUseCase: gh<_i27.GetAnnouncementPostUseCase>(),
        ));
    gh.factory<_i34.UploadViewModel>(() =>
        _i34.UploadViewModel(uploadPostUseCase: gh<_i21.UploadPostUseCase>()));
    gh.factory<_i35.AccountViewModel>(() => _i35.AccountViewModel(
          getMemberUseCase: gh<_i18.GetMemberUseCase>(),
          getPostsUseCase: gh<_i28.GetPostsUseCase>(),
          getUserPostsUseCase: gh<_i29.GetUserPostsUseCase>(),
        ));
    gh.factory<_i36.HomeViewModel>(() => _i36.HomeViewModel(
          getPostsUseCase: gh<_i28.GetPostsUseCase>(),
          getMemberUseCase: gh<_i18.GetMemberUseCase>(),
          getCalendarPostUseCase: gh<_i32.GetCalendarPostUseCase>(),
        ));
    gh.factory<_i37.PhotoViewModel>(() => _i37.PhotoViewModel(
          getPostsUseCase: gh<_i28.GetPostsUseCase>(),
          getMemberUseCase: gh<_i18.GetMemberUseCase>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i38.FirebaseModule {}
