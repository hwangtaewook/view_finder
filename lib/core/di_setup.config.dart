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
import 'package:view_finder/core/firebase_module.dart' as _i41;
import 'package:view_finder/data/data_source/announcement_post_data_source.dart'
    as _i11;
import 'package:view_finder/data/data_source/calendar_post_data_source.dart'
    as _i12;
import 'package:view_finder/data/data_source/member_data_source.dart' as _i13;
import 'package:view_finder/data/data_source/post_data_source.dart' as _i14;
import 'package:view_finder/data/repository/announcement_post_repository_impl.dart'
    as _i20;
import 'package:view_finder/data/repository/calendar_post_repository_impl.dart'
    as _i26;
import 'package:view_finder/data/repository/memeber_repository_impl.dart'
    as _i17;
import 'package:view_finder/data/repository/post_repository_impl.dart' as _i23;
import 'package:view_finder/data/services/image_meta_data_service.dart' as _i4;
import 'package:view_finder/data/services/image_upload_service.dart' as _i5;
import 'package:view_finder/data/services/register_check_service.dart' as _i15;
import 'package:view_finder/domain/repository/announcement_post_repository.dart'
    as _i19;
import 'package:view_finder/domain/repository/calendar_post_repository.dart'
    as _i25;
import 'package:view_finder/domain/repository/member_repository.dart' as _i16;
import 'package:view_finder/domain/repository/post_repository.dart' as _i22;
import 'package:view_finder/domain/use_case/delete_announcement_post_use_case.dart'
    as _i8;
import 'package:view_finder/domain/use_case/delete_calendar_post_use_case.dart'
    as _i7;
import 'package:view_finder/domain/use_case/delete_post_use_case.dart' as _i9;
import 'package:view_finder/domain/use_case/get_announcement_post_use_case.dart'
    as _i30;
import 'package:view_finder/domain/use_case/get_calendar_post_use_case.dart'
    as _i35;
import 'package:view_finder/domain/use_case/get_member_use_case.dart' as _i21;
import 'package:view_finder/domain/use_case/get_posts_use_case.dart' as _i31;
import 'package:view_finder/domain/use_case/get_user_posts_use_case.dart'
    as _i32;
import 'package:view_finder/domain/use_case/upload_announcement_post_use_case.dart'
    as _i27;
import 'package:view_finder/domain/use_case/upload_calendar_post_use_case.dart'
    as _i28;
import 'package:view_finder/domain/use_case/upload_member_use_case.dart'
    as _i10;
import 'package:view_finder/domain/use_case/upload_post_use_case.dart' as _i24;
import 'package:view_finder/domain/utils/fraction_conversion_util.dart' as _i6;
import 'package:view_finder/presentation/auth/member_detail_view_model.dart'
    as _i18;
import 'package:view_finder/presentation/detail_post_screen/detail_post_view_model.dart'
    as _i29;
import 'package:view_finder/presentation/main_screen/account/account_view_model.dart'
    as _i37;
import 'package:view_finder/presentation/main_screen/board/board_view_model.dart'
    as _i38;
import 'package:view_finder/presentation/main_screen/home/home_view_model.dart'
    as _i40;
import 'package:view_finder/presentation/main_screen/photo/photo_tab_view_model.dart'
    as _i39;
import 'package:view_finder/presentation/upload_announcement_post_screen/upload_announcement_post_view_model.dart'
    as _i33;
import 'package:view_finder/presentation/upload_calendar_post_screen/upload_calendar_post_view_model.dart'
    as _i34;
import 'package:view_finder/presentation/upload_screen/upload_view_model.dart'
    as _i36;

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
    gh.singleton<_i7.DeleteCalendarPostUseCase>(
        () => const _i7.DeleteCalendarPostUseCase());
    gh.singleton<_i8.DeleteAnnouncementPostUseCase>(
        () => const _i8.DeleteAnnouncementPostUseCase());
    gh.singleton<_i9.DeletePostUseCase>(() => const _i9.DeletePostUseCase());
    gh.singleton<_i10.UploadMemberUseCase>(() => _i10.UploadMemberUseCase(
        imageUploadService: gh<_i5.ImageUploadService>()));
    gh.singleton<_i11.AnnouncementPostDataSource>(() =>
        _i11.AnnouncementPostDataSource(
            firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i12.CalendarPostDataSource>(() => _i12.CalendarPostDataSource(
        firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i13.MemberDataSource>(() =>
        _i13.MemberDataSource(firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i14.PostDataSource>(() =>
        _i14.PostDataSource(firebaseFirestore: gh<_i3.FirebaseFirestore>()));
    gh.singleton<_i15.RegisterCheckService>(() => _i15.RegisterCheckService(
        memberDataSource: gh<_i13.MemberDataSource>()));
    gh.singleton<_i16.MemberRepository>(() => _i17.MemberRepositoryImpl(
        memberDataSource: gh<_i13.MemberDataSource>()));
    gh.factory<_i18.MemberDetailViewModel>(() => _i18.MemberDetailViewModel(
        uploadMemberUseCase: gh<_i10.UploadMemberUseCase>()));
    gh.singleton<_i19.AnnouncementPostRepository>(() =>
        _i20.AnnouncementPostRepositoryImpl(
            announcementPostDataSource: gh<_i11.AnnouncementPostDataSource>()));
    gh.singleton<_i21.GetMemberUseCase>(() =>
        _i21.GetMemberUseCase(memberRepository: gh<_i16.MemberRepository>()));
    gh.singleton<_i22.PostRepository>(() =>
        _i23.PostRepositoryImpl(postDataSource: gh<_i14.PostDataSource>()));
    gh.singleton<_i24.UploadPostUseCase>(() => _i24.UploadPostUseCase(
          imageUploadService: gh<_i5.ImageUploadService>(),
          getMemberUseCase: gh<_i21.GetMemberUseCase>(),
          imageMetaDataService: gh<_i4.ImageMetaDataService>(),
        ));
    gh.singleton<_i25.CalendarPostRepository>(() =>
        _i26.CalendarPostRepositoryImpl(
            calendarPostDataSource: gh<_i12.CalendarPostDataSource>()));
    gh.singleton<_i27.UploadAnnouncementPostUseCase>(() =>
        _i27.UploadAnnouncementPostUseCase(
            getMemberUseCase: gh<_i21.GetMemberUseCase>()));
    gh.singleton<_i28.UploadCalendarPostUseCase>(() =>
        _i28.UploadCalendarPostUseCase(
            getMemberUseCase: gh<_i21.GetMemberUseCase>()));
    gh.factory<_i29.DetailPostViewModel>(() => _i29.DetailPostViewModel(
          getMemberUseCase: gh<_i21.GetMemberUseCase>(),
          fractionConversionService: gh<_i6.FractionConversionUtil>(),
        ));
    gh.singleton<_i30.GetAnnouncementPostUseCase>(() =>
        _i30.GetAnnouncementPostUseCase(
            announcementPostRepository: gh<_i19.AnnouncementPostRepository>()));
    gh.singleton<_i31.GetPostsUseCase>(
        () => _i31.GetPostsUseCase(postRepository: gh<_i22.PostRepository>()));
    gh.singleton<_i32.GetUserPostsUseCase>(() =>
        _i32.GetUserPostsUseCase(postRepository: gh<_i22.PostRepository>()));
    gh.factory<_i33.UploadAnnouncementPostViewModel>(() =>
        _i33.UploadAnnouncementPostViewModel(
            uploadAnnouncementPostUseCase:
                gh<_i27.UploadAnnouncementPostUseCase>()));
    gh.factory<_i34.UploadCalendarPostViewModel>(() =>
        _i34.UploadCalendarPostViewModel(
            uploadCalendarPostUseCase: gh<_i28.UploadCalendarPostUseCase>()));
    gh.singleton<_i35.GetCalendarPostUseCase>(() => _i35.GetCalendarPostUseCase(
        calendarPostRepository: gh<_i25.CalendarPostRepository>()));
    gh.factory<_i36.UploadViewModel>(() =>
        _i36.UploadViewModel(uploadPostUseCase: gh<_i24.UploadPostUseCase>()));
    gh.factory<_i37.AccountViewModel>(() => _i37.AccountViewModel(
          getMemberUseCase: gh<_i21.GetMemberUseCase>(),
          getPostsUseCase: gh<_i31.GetPostsUseCase>(),
          getUserPostsUseCase: gh<_i32.GetUserPostsUseCase>(),
        ));
    gh.factory<_i38.BoardViewModel>(() => _i38.BoardViewModel(
          getPostsUseCase: gh<_i31.GetPostsUseCase>(),
          getMemberUseCase: gh<_i21.GetMemberUseCase>(),
          getAnnouncementPostUseCase: gh<_i30.GetAnnouncementPostUseCase>(),
          getCalendarPostUseCase: gh<_i35.GetCalendarPostUseCase>(),
          deleteCalendarPostUseCase: gh<_i7.DeleteCalendarPostUseCase>(),
          deletePostUseCase: gh<_i9.DeletePostUseCase>(),
          deleteAnnouncementPostUseCase:
              gh<_i8.DeleteAnnouncementPostUseCase>(),
        ));
    gh.factory<_i39.PhotoViewModel>(() => _i39.PhotoViewModel(
          getPostsUseCase: gh<_i31.GetPostsUseCase>(),
          getMemberUseCase: gh<_i21.GetMemberUseCase>(),
        ));
    gh.factory<_i40.HomeViewModel>(() => _i40.HomeViewModel(
          getMemberUseCase: gh<_i21.GetMemberUseCase>(),
          getCalendarPostUseCase: gh<_i35.GetCalendarPostUseCase>(),
          getAnnouncementPostUseCase: gh<_i30.GetAnnouncementPostUseCase>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i41.FirebaseModule {}
