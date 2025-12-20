// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../api/api_services.dart' as _i124;
import '../api/data_sources/remote/auth/auth_remote_data_source_impl.dart'
    as _i983;
import '../api/data_sources/remote/brands/brands_remote_data_source_impl.dart'
    as _i948;
import '../api/data_sources/remote/cart/cart_remote_data_source_impl.dart'
    as _i835;
import '../api/data_sources/remote/categories/categories_remote_data_source_impl.dart'
    as _i661;
import '../api/data_sources/remote/Products/products_remote_data_source_impl.dart'
    as _i666;
import '../api/data_sources/remote/wishList/wishlist_remote_data_source_impl.dart'
    as _i161;
import '../api/dio/dio_module.dart' as _i223;
import '../data/data_sources/remote/auth/auth_remote_data_source.dart' as _i16;
import '../data/data_sources/remote/brands/brands_remote_data_source.dart'
    as _i1058;
import '../data/data_sources/remote/cart/cart_remote_data_source.dart' as _i142;
import '../data/data_sources/remote/categories/categories_remote_data_source.dart'
    as _i699;
import '../data/data_sources/remote/products/products_remote_data_source.dart'
    as _i45;
import '../data/data_sources/remote/wishlist/wishlist_remote_data_source.dart'
    as _i935;
import '../data/repository/repositories/auth/auth_repository_impl.dart'
    as _i697;
import '../data/repository/repositories/brands/brands_repository_impl.dart'
    as _i606;
import '../data/repository/repositories/cart/cart_repository_impl.dart' as _i56;
import '../data/repository/repositories/categories/categories_repository_imp.dart'
    as _i808;
import '../data/repository/repositories/products/products_repository_impl.dart'
    as _i731;
import '../data/repository/repositories/wishlist/wishlist_repository_impl.dart'
    as _i320;
import '../domain/repository/auth/auth_repository.dart' as _i824;
import '../domain/repository/brands/brands_repository.dart' as _i949;
import '../domain/repository/cart/cart_repository.dart' as _i428;
import '../domain/repository/categories/categories_repository.dart' as _i2;
import '../domain/repository/products/products_repository.dart' as _i547;
import '../domain/repository/wishlist/wishlist_repository.dart' as _i1054;
import '../domain/use_cases/brands/brands_use_case.dart' as _i947;
import '../domain/use_cases/cart/addcart/add_cart_use_case.dart' as _i293;
import '../domain/use_cases/cart/deletecart/delete_cart_use_case.dart' as _i876;
import '../domain/use_cases/cart/getcart/get_cart_use_case.dart' as _i951;
import '../domain/use_cases/cart/updatecart/update_cart_use_case.dart' as _i646;
import '../domain/use_cases/categories/categories_use_case.dart' as _i497;
import '../domain/use_cases/login_use_case.dart' as _i826;
import '../domain/use_cases/products/products_use_case.dart' as _i709;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../domain/use_cases/wishlist/addwishlist/add_wishlist_use_case.dart'
    as _i200;
import '../domain/use_cases/wishlist/deletewishlist/delete_wishlist_use_case.dart'
    as _i332;
import '../domain/use_cases/wishlist/getwishlist/get_wishlist_use_case.dart'
    as _i421;
import '../features/ui/auth/login/cubit/login_view_model.dart' as _i1040;
import '../features/ui/auth/register/cubit/register_view_model.dart' as _i586;
import '../features/ui/pages/cart/cubit/cart_view_model.dart' as _i888;
import '../features/ui/pages/home/cubit/home_screen_view_model.dart' as _i334;
import '../features/ui/pages/home/tabs/favorite_tab/cubit/wishlist_view_model.dart'
    as _i493;
import '../features/ui/pages/home/tabs/home_tab/cubit/brands_view_model.dart'
    as _i292;
import '../features/ui/pages/home/tabs/home_tab/cubit/categories_view_model.dart'
    as _i572;
import '../features/ui/pages/home/tabs/product_tab/cubit/products_view_model.dart'
    as _i819;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i334.HomeScreenViewModel>(() => _i334.HomeScreenViewModel());
    gh.singleton<_i361.BaseOptions>(() => getItModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
      () => getItModule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i124.ApiServices>(
      () => getItModule.provideApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i142.CartRemoteDataSource>(
      () => _i835.AddCartRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i935.WishListRemoteDataSource>(
      () => _i161.WishListCartRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i1058.BrandsRemoteDataSource>(
      () => _i948.BrandsRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i699.CategoriesRemoteDataSource>(
      () => _i661.CategoriesRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i16.AuthRemoteDataSource>(
      () =>
          _i983.AuthRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i428.CartRepository>(
      () => _i56.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i142.CartRemoteDataSource>(),
      ),
    );
    gh.factory<_i45.ProductsRemoteDataSource>(
      () => _i666.ProductsRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i293.AddCartUseCase>(
      () => _i293.AddCartUseCase(addCartRepository: gh<_i428.CartRepository>()),
    );
    gh.factory<_i876.DeleteItemCartUseCase>(
      () => _i876.DeleteItemCartUseCase(
        getCartRepository: gh<_i428.CartRepository>(),
      ),
    );
    gh.factory<_i951.GetCartUseCase>(
      () => _i951.GetCartUseCase(getCartRepository: gh<_i428.CartRepository>()),
    );
    gh.factory<_i646.UpdateItemCartUseCase>(
      () => _i646.UpdateItemCartUseCase(
        getCartRepository: gh<_i428.CartRepository>(),
      ),
    );
    gh.factory<_i1054.WishListRepository>(
      () => _i320.WishListRepositoryImpl(
        wishListRemoteDataSource: gh<_i935.WishListRemoteDataSource>(),
      ),
    );
    gh.factory<_i200.AddWishListUseCase>(
      () => _i200.AddWishListUseCase(
        wishlistRepository: gh<_i1054.WishListRepository>(),
      ),
    );
    gh.factory<_i547.ProductsRepository>(
      () => _i731.ProductsRepositoryImpl(
        productsRemoteDataSource: gh<_i45.ProductsRemoteDataSource>(),
      ),
    );
    gh.factory<_i2.CategoriesRepository>(
      () => _i808.CategoriesRepositoryImpl(
        categoriesRemoteDataSource: gh<_i699.CategoriesRemoteDataSource>(),
      ),
    );
    gh.factory<_i709.ProductsUseCase>(
      () => _i709.ProductsUseCase(
        productsRepository: gh<_i547.ProductsRepository>(),
      ),
    );
    gh.factory<_i949.BrandsRepository>(
      () => _i606.BrandsRepositoryImpl(
        brandsRemoteDataSource: gh<_i1058.BrandsRemoteDataSource>(),
      ),
    );
    gh.factory<_i888.CartViewModel>(
      () => _i888.CartViewModel(
        addCartUseCase: gh<_i293.AddCartUseCase>(),
        getCartUseCase: gh<_i951.GetCartUseCase>(),
        updateItemCartUseCase: gh<_i646.UpdateItemCartUseCase>(),
        deleteItemCartUseCase: gh<_i876.DeleteItemCartUseCase>(),
      ),
    );
    gh.factory<_i824.AuthRepository>(
      () => _i697.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i16.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i332.DeleteItemWishListUseCase>(
      () => _i332.DeleteItemWishListUseCase(
        wishListRepository: gh<_i1054.WishListRepository>(),
      ),
    );
    gh.factory<_i421.GetWishListUseCase>(
      () => _i421.GetWishListUseCase(
        wishListRepository: gh<_i1054.WishListRepository>(),
      ),
    );
    gh.factory<_i826.LoginUseCase>(
      () => _i826.LoginUseCase(authRepository: gh<_i824.AuthRepository>()),
    );
    gh.factory<_i772.RegisterUseCase>(
      () => _i772.RegisterUseCase(authRepository: gh<_i824.AuthRepository>()),
    );
    gh.factory<_i493.WishListViewModel>(
      () => _i493.WishListViewModel(
        addWishListUseCase: gh<_i200.AddWishListUseCase>(),
        getWishListUseCase: gh<_i421.GetWishListUseCase>(),
        deleteItemWishListUseCase: gh<_i332.DeleteItemWishListUseCase>(),
      ),
    );
    gh.factory<_i947.BrandsUseCase>(
      () => _i947.BrandsUseCase(brandsRepository: gh<_i949.BrandsRepository>()),
    );
    gh.factory<_i819.ProductsViewModel>(
      () =>
          _i819.ProductsViewModel(productsUseCase: gh<_i709.ProductsUseCase>()),
    );
    gh.factory<_i497.CategoriesUseCase>(
      () => _i497.CategoriesUseCase(
        categoriesRepository: gh<_i2.CategoriesRepository>(),
      ),
    );
    gh.factory<_i1040.LoginViewModel>(
      () => _i1040.LoginViewModel(loginUseCase: gh<_i826.LoginUseCase>()),
    );
    gh.factory<_i292.BrandsViewModel>(
      () => _i292.BrandsViewModel(brandsUseCase: gh<_i947.BrandsUseCase>()),
    );
    gh.factory<_i586.RegisterViewModel>(
      () =>
          _i586.RegisterViewModel(registerUseCase: gh<_i772.RegisterUseCase>()),
    );
    gh.factory<_i572.CategoriesViewModel>(
      () => _i572.CategoriesViewModel(
        categoriesUseCase: gh<_i497.CategoriesUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i223.GetItModule {}
