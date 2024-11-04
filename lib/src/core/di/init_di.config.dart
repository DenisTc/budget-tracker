// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/category/data/datasource/category_local_data_source.dart'
    as _i58;
import '../../feature/category/data/repos/category_repo_impl.dart' as _i889;
import '../../feature/category/domain/repos/transaction_repo.dart' as _i999;
import '../../feature/category/domain/usecases/add_category.dart' as _i618;
import '../../feature/category/domain/usecases/check_is_exist_category.dart'
    as _i691;
import '../../feature/category/domain/usecases/get_categories.dart' as _i863;
import '../../feature/category/domain/usecases/remove_category.dart' as _i672;
import '../../feature/category/domain/usecases/update_category.dart' as _i941;
import '../../feature/category/presentation/cubit/category_cubit.dart' as _i618;
import '../../feature/category_list/presentation/cubit/category_list_cubit.dart'
    as _i171;
import '../../feature/transaction/data/datasource/transaction_local_data_source.dart'
    as _i1048;
import '../../feature/transaction/data/repos/transaction_repo_impl.dart'
    as _i564;
import '../../feature/transaction/domain/repos/transaction_repo.dart' as _i17;
import '../../feature/transaction/domain/usecases/add_transaction.dart'
    as _i974;
import '../../feature/transaction/domain/usecases/get_transactions.dart'
    as _i675;
import '../../feature/transaction/domain/usecases/remove_transaction.dart'
    as _i368;
import '../../feature/transaction/domain/usecases/update_transaction.dart'
    as _i739;
import '../../feature/transaction_list/presentation/cubit/transaction_list_cubit.dart'
    as _i444;
import '../database/app_database.dart' as _i982;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i982.AppDatabase>(() => _i982.AppDatabase());
    gh.lazySingleton<_i58.CategoryLocalDataSource>(
        () => _i58.CategoryLocalDataSourceImpl(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i1048.TransactionLocalDataSource>(
        () => _i1048.TransactionLocalDataSourceImpl(gh<_i982.AppDatabase>()));
    gh.lazySingleton<_i17.TransactionRepository>(() =>
        _i564.TransactionRepositoryImpl(
            gh<_i1048.TransactionLocalDataSource>()));
    gh.lazySingleton<_i999.CategoryRepository>(
        () => _i889.CategoryRepositoryImpl(gh<_i58.CategoryLocalDataSource>()));
    gh.lazySingleton<_i941.UpdateCategoryUseCase>(
        () => _i941.UpdateCategoryUseCase(gh<_i999.CategoryRepository>()));
    gh.lazySingleton<_i691.CheckisExistCategoryUseCase>(() =>
        _i691.CheckisExistCategoryUseCase(gh<_i999.CategoryRepository>()));
    gh.lazySingleton<_i863.GetCategoriesUseCase>(
        () => _i863.GetCategoriesUseCase(gh<_i999.CategoryRepository>()));
    gh.lazySingleton<_i672.RemoveCategoryUseCase>(
        () => _i672.RemoveCategoryUseCase(gh<_i999.CategoryRepository>()));
    gh.lazySingleton<_i618.AddCategoryUseCase>(
        () => _i618.AddCategoryUseCase(gh<_i999.CategoryRepository>()));
    gh.lazySingleton<_i675.GetTransactionsUseCase>(
        () => _i675.GetTransactionsUseCase(gh<_i17.TransactionRepository>()));
    gh.lazySingleton<_i974.AddTransactionUseCase>(
        () => _i974.AddTransactionUseCase(gh<_i17.TransactionRepository>()));
    gh.lazySingleton<_i739.UpdateTransactionUseCase>(
        () => _i739.UpdateTransactionUseCase(gh<_i17.TransactionRepository>()));
    gh.lazySingleton<_i368.RemoveTransactionUseCase>(
        () => _i368.RemoveTransactionUseCase(gh<_i17.TransactionRepository>()));
    gh.singleton<_i444.TransactionListCubit>(
        () => _i444.TransactionListCubit(gh<_i675.GetTransactionsUseCase>()));
    gh.singleton<_i171.CategoryListCubit>(
        () => _i171.CategoryListCubit(gh<_i863.GetCategoriesUseCase>()));
    gh.singleton<_i618.CategoryCubit>(() => _i618.CategoryCubit(
          addCategory: gh<_i618.AddCategoryUseCase>(),
          removeCategory: gh<_i672.RemoveCategoryUseCase>(),
          updateCategory: gh<_i941.UpdateCategoryUseCase>(),
          checkisExistCategory: gh<_i691.CheckisExistCategoryUseCase>(),
        ));
    return this;
  }
}
