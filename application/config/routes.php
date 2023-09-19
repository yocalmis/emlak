<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'Index';
$route['404_override'] = 'custom404';
$route['translate_uri_dashes'] = FALSE;

$route['contact'] = 'index/contact';
$route['about'] = 'index/about';
$route['search'] = 'index/search';
$route['search/(:any)'] = 'index/search';
$route['news'] = 'index/haber_kategori_tum';
$route['news/(:any)'] = 'index/haber_kategori_tum/$1';
$route['projects'] = 'index/proje_kategori_tum';
$route['projects/(:any)'] = 'index/proje_kategori_tum/$1';

$route['ar'] = 'ar/index';
$route['ar/contact'] = 'ar/contact';
$route['ar/about'] = 'ar/about';
$route['ar/search'] = 'ar/search';
$route['ar/search/(:any)'] = 'ar/search';
$route['ar/news'] = 'ar/haber_kategori_tum';
$route['ar/news/(:any)'] = 'ar/haber_kategori_tum/$1';
$route['ar/projects'] = 'ar/proje_kategori_tum';
$route['ar/projects/(:any)'] = 'ar/proje_kategori_tum/$1';

$route['frs'] = 'frs/index';
$route['frs/contact'] = 'frs/contact';
$route['frs/about'] = 'frs/about';
$route['frs/search'] = 'frs/search';
$route['frs/search/(:any)'] = 'frs/search';
$route['frs/news'] = 'frs/haber_kategori_tum';
$route['frs/news/(:any)'] = 'frs/haber_kategori_tum/$1';
$route['frs/projects'] = 'frs/proje_kategori_tum';
$route['frs/projects/(:any)'] = 'frs/proje_kategori_tum/$1';



$route['yonetim'] = 'yonetim/index';
$route['yonetim/(:any)'] = 'yonetim/$1';
$route['yonetim/(:any)/(:any)'] = 'yonetim/$1/$2';



$route['ar/(:any)'] = 'ar/index/$1';
$route['frs/(:any)'] = 'frs/index/$1';
$route['(:any)'] = 'index/index/$1';
$route['ar/(:any)/(:any)'] = 'ar/index/$1/$2';
$route['frs/(:any)/(:any)'] = 'frs/index/$1/$2';
$route['(:any)/(:any)'] = 'index/index/$1/$2';




