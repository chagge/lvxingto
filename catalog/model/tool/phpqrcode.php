<?php 
class ModelToolPhpqrcode extends Model {
	public function qrcode($qr) {
		$value = $qr['url']; //二维码文字内容   
		if (isset($qr['level'])) {//参数$level表示容错率，也就是有被覆盖的区域还能识别，分别是 L（QR_ECLEVEL_L，7%），M（QR_ECLEVEL_M，15%），Q（QR_ECLEVEL_Q，25%），H（QR_ECLEVEL_H，30%）；
			$errorCorrectionLevel = $qr['level'];//容错级别   
		}else {
			$errorCorrectionLevel = 'H';//容错级别
		}
		if (isset($qr['size'])) {
			$matrixPointSize = $qr['size'];//生成图片大小 
		}else {
			$matrixPointSize = 3;//生成图片大小
		}
		if (isset($qr['margin'])) {
			$marginsize=$qr['margin'];
		}else {
			$marginsize= 2;
		}
		$qrname='image/qr/'.date("Ymdhis").rand(10000,99999).'.png';
		//生成二维码图片   
		QRcode::png($value, $qrname, $errorCorrectionLevel, $matrixPointSize, $marginsize);   
		$logo = $qr['logourl'];//准备好的logo图片   
		$QR = $qrname;//已经生成的原始二维码图  
		
		if ($logo !== FALSE) {   
		    $QR = imagecreatefromstring(file_get_contents($QR));   
		    $logo = imagecreatefromstring(file_get_contents($logo));   
		    $QR_width = imagesx($QR);//二维码图片宽度   
		    $QR_height = imagesy($QR);//二维码图片高度   
		    $logo_width = imagesx($logo);//logo图片宽度   
		    $logo_height = imagesy($logo);//logo图片高度   
		    $logo_qr_width = $QR_width / 4;   
		    $scale = $logo_width/$logo_qr_width;   
		    $logo_qr_height = $logo_height/$scale;   
		    $from_width = ($QR_width - $logo_qr_width) / 2;   
		    //重新组合图片并调整大小   
		    imagecopyresampled($QR, $logo, $from_width, $from_width, 0, 0, $logo_qr_width,   
		    $logo_qr_height, $logo_width, $logo_height);   
		}

		//更新数据库中的qr记录
		/*
		$this->db->query("UPDATE " . DB_PREFIX . "`setting` SET `value` = '" . $qrname . "' WHERE `key` = '" . 'config_qr' . "'");
		*/
		
		//输出图片   
		imagepng($QR, $qrname);
		return '<img src="'.$qrname.'">';
	}
}