<?php

use Dingo\Api\Routing\Router;

/** @var Router $api */
$api = app(Router::class);

$api->version('v1', function (Router $api) {
    $api->group(['middleware' => 'cors'], function (Router $api) {
        $api->group(['prefix' => 'auth'], function (Router $api) {
            $api->post('signup', 'App\\Api\\V1\\Controllers\\SignUpController@signUp');
            $api->post('login', 'App\\Api\\V1\\Controllers\\LoginController@login');
            $api->post('validate', 'App\\Api\\V1\\Controllers\\ProfileController@validate_uniq_id');
            $api->post('recovery', 'App\\Api\\V1\\Controllers\\ForgotPasswordController@sendResetEmail');
            $api->post('reset', 'App\\Api\\V1\\Controllers\\ResetPasswordController@resetPassword');
            $api->put('resetpassword', 'App\\Api\\V1\\Controllers\\ResetPasswordController@update_password');
            $api->put('changelevel', 'App\\Api\\V1\\Controllers\\ResetPasswordController@change_level');
            $api->post('logout', 'App\\Api\\V1\\Controllers\\LogoutController@logout');
            $api->post('refresh', 'App\\Api\\V1\\Controllers\\RefreshController@refresh');
            $api->get('me', 'App\\Api\\V1\\Controllers\\UserController@me');
            $api->get('service', 'App\\Api\\V1\\Controllers\\ServiceReportController@index');
        });

        // $api->group(['prefix' => 'dashboard'], function (Router $api) {
        //     $api->get('/', 'App\\Api\\V1\\Controllers\\ApiDashboardController@index');
        // });

        $api->group(['prefix' => 'attendance'], function (Router $api) {
            $api->get('/', 'App\\Api\\V1\\Controllers\\AttendanceController@index');
            $api->get('/total_now', 'App\\Api\\V1\\Controllers\\AttendanceController@total_now');
            $api->post('/in', 'App\\Api\\V1\\Controllers\\AttendanceController@attendance_in');
            $api->post('/out', 'App\\Api\\V1\\Controllers\\AttendanceController@attendance_out');
            $api->get('/export', 'App\\Api\\V1\\Controllers\\AttendanceController@export_attendance');
            $api->post('/create/logs', 'App\\Api\\V1\\Controllers\\AttendanceController@create_logs');
            $api->get('/view/logs', 'App\\Api\\V1\\Controllers\\AttendanceController@view_logs');
            $api->delete('/{id}', 'App\\Api\\V1\\Controllers\\AttendanceController@attendance_delete');
            $api->get('/activity', 'App\\Api\\V1\\Controllers\\AttendanceController@activity_list');
        });

        $api->group(['prefix' => 'users'], function (Router $api) {
            $api->get('/', 'App\\Api\\V1\\Controllers\\ProfileController@index');
            $api->get('/profile', 'App\\Api\\V1\\Controllers\\ProfileController@show');
            $api->get('/role', 'App\\Api\\V1\\Controllers\\ProfileController@list_role');
            $api->get('/list', 'App\\Api\\V1\\Controllers\\ProfileController@user_list');
            $api->put('/edit', 'App\\Api\\V1\\Controllers\\ProfileController@edit');
            $api->put('/update', 'App\\Api\\V1\\Controllers\\ProfileController@update');
            $api->post('/upload', 'App\\Api\\V1\\Controllers\\ProfileController@upload_user');
            $api->get('/need_active', 'App\\Api\\V1\\Controllers\\ProfileController@user_need_to_activated');
            $api->put('/activated/{id}', 'App\\Api\\V1\\Controllers\\ProfileController@activated_user');

        });

        $api->group(['prefix' => 'employee'], function (Router $api) {
            $api->get('/', 'App\\Api\\V1\\Controllers\\EmployeeController@list');
            $api->get('/show', 'App\\Api\\V1\\Controllers\\EmployeeController@show');
            $api->post('/create', 'App\\Api\\V1\\Controllers\\EmployeeController@create');
            $api->put('/edit', 'App\\Api\\V1\\Controllers\\EmployeeController@edit');
            $api->post('/division/add', 'App\\Api\\V1\\Controllers\\EmployeeController@division_create');
            $api->get('/division/list', 'App\\Api\\V1\\Controllers\\EmployeeController@division_list');
            $api->post('/religion/add', 'App\\Api\\V1\\Controllers\\EmployeeController@religion_create');
            $api->get('/religion/list', 'App\\Api\\V1\\Controllers\\EmployeeController@religion_list');
            $api->post('/upload', 'App\\Api\\V1\\Controllers\\EmployeeController@upload_employee');
            $api->get('/customer/list', 'App\\Api\\V1\\Controllers\\EmployeeController@customer_list');
        });

        $api->group(['prefix' => 'area'], function (Router $api) {
            $api->get('/', 'App\\Api\\V1\\Controllers\\EmployeeController@area_list');
            $api->post('/add', 'App\\Api\\V1\\Controllers\\EmployeeController@area_create');
            $api->put('/edit', 'App\\Api\\V1\\Controllers\\EmployeeController@area_edit');
            $api->get('/cluster', 'App\\Api\\V1\\Controllers\\EmployeeController@cluster_list');
            $api->post('/create/cluster', 'App\\Api\\V1\\Controllers\\EmployeeController@add_cluster');
            $api->put('/edit/cluster', 'App\\Api\\V1\\Controllers\\EmployeeController@cluster_edit');
        });

        $api->group(['prefix' => 'admin'], function (Router $api) {
            $api->get('/customer', 'App\\Api\\V1\\Controllers\\CustomerController@index');
            $api->get('/customer/{id}', 'App\\Api\\V1\\Controllers\\CustomerController@show');
            $api->post('/customer', 'App\\Api\\V1\\Controllers\\CustomerController@store');
            $api->put('/customer', 'App\\Api\\V1\\Controllers\\CustomerController@update');
            $api->delete('/customer/{id}', 'App\\Api\\V1\\Controllers\\CustomerController@delete');

            $api->get('/division', 'App\\Api\\V1\\Controllers\\DivisionController@index');
            $api->get('/division/{id}', 'App\\Api\\V1\\Controllers\\DivisionController@show');
            $api->post('/division', 'App\\Api\\V1\\Controllers\\DivisionController@store');
            $api->put('/division', 'App\\Api\\V1\\Controllers\\DivisionController@update');
            $api->delete('/division/{id}', 'App\\Api\\V1\\Controllers\\DivisionController@delete');

            $api->get('/region', 'App\\Api\\V1\\Controllers\\RegionController@index');
            $api->get('/region/{id}', 'App\\Api\\V1\\Controllers\\RegionController@show');
            $api->post('/region', 'App\\Api\\V1\\Controllers\\RegionController@store');
            $api->put('/region', 'App\\Api\\V1\\Controllers\\RegionController@update');
            $api->delete('/region/{id}', 'App\\Api\\V1\\Controllers\\RegionController@delete');

            $api->get('/area', 'App\\Api\\V1\\Controllers\\AreaController@index');
            $api->get('/area/{id}', 'App\\Api\\V1\\Controllers\\AreaController@show');
            $api->post('/area', 'App\\Api\\V1\\Controllers\\AreaController@store');
            $api->put('/area', 'App\\Api\\V1\\Controllers\\AreaController@update');
            $api->delete('/area/{id}', 'App\\Api\\V1\\Controllers\\AreaController@delete');

            $api->get('/city', 'App\\Api\\V1\\Controllers\\CityController@index');
            $api->get('/city/{id}', 'App\\Api\\V1\\Controllers\\CityController@show');
            $api->post('/city', 'App\\Api\\V1\\Controllers\\CityController@store');
            $api->put('/city', 'App\\Api\\V1\\Controllers\\CityController@update');
            $api->delete('/city/{id}', 'App\\Api\\V1\\Controllers\\CityController@delete');

            $api->get('/cluster', 'App\\Api\\V1\\Controllers\\ClusterController@index');
            $api->get('/cluster/{id}', 'App\\Api\\V1\\Controllers\\ClusterController@show');
            $api->post('/cluster', 'App\\Api\\V1\\Controllers\\ClusterController@store');
            $api->put('/cluster', 'App\\Api\\V1\\Controllers\\ClusterController@update');
            $api->delete('/cluster/{id}', 'App\\Api\\V1\\Controllers\\ClusterController@delete');


        });

      

        $api->group(['prefix' => 'site'], function (Router $api) {
            $api->get('/', 'App\\Api\\V1\\Controllers\\SiteController@index');
            $api->get('/show', 'App\\Api\\V1\\Controllers\\SiteController@show');
            $api->post('/create', 'App\\Api\\V1\\Controllers\\SiteController@create');
            $api->post('/edit', 'App\\Api\\V1\\Controllers\\SiteController@edit');
            $api->get('/check_distance', 'App\\Api\\V1\\Controllers\\SiteController@check_distance');
            $api->get('/check_current_distance', 'App\\Api\\V1\\Controllers\\SiteController@check_current_distance');
            $api->post('/upload/site', 'App\\Api\\V1\\Controllers\\SiteController@upload_site');
            $api->post('/radius', 'App\\Api\\V1\\Controllers\\SiteController@create_radius');
            $api->get('/current_radius', 'App\\Api\\V1\\Controllers\\SiteController@current_radius');
            $api->get('/list_radius', 'App\\Api\\V1\\Controllers\\SiteController@list_radius');
            $api->put('/update_current_radius', 'App\\Api\\V1\\Controllers\\SiteController@update_radius');
        });
        $api->group(['prefix' => 'reimburstment'], function (Router $api) {
            $api->get('/', 'App\\Api\\V1\\Controllers\\ReimburstmentController@index');
            $api->get('/header_type', 'App\\Api\\V1\\Controllers\\ReimburstmentController@header_type');
            $api->get('/type', 'App\\Api\\V1\\Controllers\\ReimburstmentController@type');
            $api->post('/create', 'App\\Api\\V1\\Controllers\\ReimburstmentController@add_reimburst');
            $api->put('/update', 'App\\Api\\V1\\Controllers\\ReimburstmentController@update');
            $api->get('/export', 'App\\Api\\V1\\Controllers\\ReimburstmentController@export_reimburst');
        });

        $api->get('/check_version', 'App\\Api\\V1\\Controllers\\ApiAppVersionController@checkversion');

        $api->group(['prefix' => 'report'], function (Router $api) {
            $api->get('/001', 'App\\Api\\V1\\Controllers\\ApiProjectCostController@export_project_performance_summary');
        });

        $api->group(['prefix' => 'testing'], function (Router $api) {
            $api->get('/', 'App\\Api\\V1\\Controllers\\ApiTestingController@test');
        });

        $api->group(['middleware' => 'jwt.auth'], function (Router $api) {
            $api->get('protected', function () {
                return response()->json([
                    'message' => 'Access to protected resources granted! You are seeing this text as you provided the token correctly.'
                ]);
            });

            $api->get('refresh', [
                'middleware' => 'jwt.refresh',
                function () {
                    return response()->json([
                        'message' => 'By accessing this endpoint, you can refresh your access token at each request. Check out this response headers!'
                    ]);
                }
            ]);
        });

        $api->group(['middleware' => 'jwt.auth'], function (Router $api) {
            $api->post('divisions/store', 'App\\Api\\V1\\Controllers\\DivisionController@store');
            $api->get('divisions', 'App\\Api\\V1\\Controllers\\DivisionController@index');
        });


        $api->get('hello', function () {
            return response()->json([
                'message' => 'This is a simple example of item returned by your APIs. Everyone can see it.'
            ]);
        });
    });
});
