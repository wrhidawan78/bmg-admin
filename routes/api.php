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
            $api->post('/in', 'App\\Api\\V1\\Controllers\\AttendanceController@attendance_in');
            $api->post('/out', 'App\\Api\\V1\\Controllers\\AttendanceController@attendance_out');
            $api->get('/export', 'App\\Api\\V1\\Controllers\\AttendanceController@export_attendance');
            $api->post('/create/logs', 'App\\Api\\V1\\Controllers\\AttendanceController@create_logs');
            $api->get('/view/logs', 'App\\Api\\V1\\Controllers\\AttendanceController@view_logs');

        });

        $api->group(['prefix' => 'users'], function (Router $api) {
            $api->get('/', 'App\\Api\\V1\\Controllers\\ProfileController@index');
            $api->get('/profile', 'App\\Api\\V1\\Controllers\\ProfileController@show');
            $api->get('/role', 'App\\Api\\V1\\Controllers\\ProfileController@list_role');
            $api->put('/edit', 'App\\Api\\V1\\Controllers\\ProfileController@edit');
            $api->put('/update', 'App\\Api\\V1\\Controllers\\ProfileController@update');
            $api->post('/upload', 'App\\Api\\V1\\Controllers\\ProfileController@upload_user');
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
        });

        $api->group(['prefix' => 'area'], function (Router $api) {
            $api->get('/', 'App\\Api\\V1\\Controllers\\EmployeeController@area_list');
            $api->post('/add', 'App\\Api\\V1\\Controllers\\EmployeeController@area_create');
            $api->put('/edit', 'App\\Api\\V1\\Controllers\\EmployeeController@area_edit');
            $api->get('/cluster', 'App\\Api\\V1\\Controllers\\EmployeeController@cluster_list');
            $api->post('/create/cluster', 'App\\Api\\V1\\Controllers\\EmployeeController@add_cluster');
            $api->put('/edit/cluster', 'App\\Api\\V1\\Controllers\\EmployeeController@cluster_edit');
        });

        $api->group(['prefix' => 'site'], function (Router $api) {
            $api->get('/', 'App\\Api\\V1\\Controllers\\SiteController@index');
            $api->get('/show', 'App\\Api\\V1\\Controllers\\SiteController@show');
            $api->post('/create', 'App\\Api\\V1\\Controllers\\SiteController@create');
            $api->post('/edit', 'App\\Api\\V1\\Controllers\\SiteController@edit');
            $api->get('/check_distance', 'App\\Api\\V1\\Controllers\\SiteController@check_distance');
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
