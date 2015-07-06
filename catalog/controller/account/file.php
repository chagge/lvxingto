<?php
class ControllerAccountFile extends Controller {
	public function index() {
		$ignore = array(//排除的不搜索的值
				'common/dashboard',
				'common/startup',
				'common/login',
				'common/logout',
				'common/forgotten',
				'common/reset',
				'error/not_found',
				'error/permission',
				'common/footer',
				'common/header',
				'dashboard/order',
				'dashboard/sale',
				'dashboard/customer',
				'dashboard/online',
				'dashboard/map',
				'dashboard/activity',
				'dashboard/chart'
		);
	$data['permissions'] = array();
	
	$files = glob(DIR_APPLICATION . '../catalog/controller/*/*.php');
	
	foreach ($files as $file) {
		$part = explode('/', dirname($file));
	
		$permission = end($part) . '/' . basename($file, '.php');
	
		if (!in_array($permission, $ignore)) {
			$data['permissions'][] = $permission;
			}
		}
		
		var_dump($data['permissions']);
	}
}