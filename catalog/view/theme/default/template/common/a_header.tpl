<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/jquery.lazyload.js"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!--<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />-->
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<nav id="top" class="navbar-fixed-top hidden-xs">
  <div class="container">
  	<div class="wecome"><span class="hidden-xs"><?php echo $text_welcome; ?><?php echo $text_logged; ?></span><a href="<?php echo $logout; ?>"><i class="visible-xs fa fa-sign-out"></i></a></div>
    <?php echo $currency; ?>
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_my_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-th-large"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_my_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
          </ul>
        </li>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li id="cart" class="dropdown"><a class="cart-total" href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>" data-toggle="dropdown"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span><span class="caret"></span></a><?php echo $cart; ?></li>
        <li><a href="<?php echo $businesses; ?>"><i class="fa fa-paper-plane"></i><span class="hidden-xs hidden-sm hidden-md header-contact-us"><?php echo $text_businesses; ?></span><span class="caret"></span></a></li>
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone-square"></i><span class="hidden-xs hidden-sm hidden-md header-contact-us"><?php echo $text_contact_us; ?></span></a></li>
        <li><a><i class="fa fa-crosshairs"></i><span class="hidden-xs hidden-sm hidden-md header-contact-us"><?php echo $text_map; ?></span><span class="caret"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="top-bottom hidden-xs"></div>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
      <div class="col-sm-2 hidden-xs"></div>
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-5"><?php echo $search; ?><div class="hidden-xs seach-top"><?php echo $text_search_key; ?>
      <?php foreach ($search_key as $search_okey) { ?>
	  <a href="<?php echo $search_url.'&search='.$search_okey['search_key']; ?>"><?php echo $search_okey['search_key']; ?></a>
	  <?php } ?>
	  </div></div>
    </div>
  </div>
</header>
<?php if ($categories) { ?>
<div class="container">
  <nav id="menu" class="navbar seller-admin-nv">
    <div class="navbar-header"><span id="category" class="visible-xs btn-nav-category"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if (!empty($category['name'])) { ?><?php if (!empty($category['href'])) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle"><?php echo $category['name']; ?></a>
			<?php if ($category['children']) { ?>
        	<span class="ochow-menu-item-toggle ochow-close visible-xs">
            <i class="fa fa-plus"></i>
            <i class="fa fa-minus"></i>
          </span>
          <span class="ochow-menu-item-arrow hidden-xs">
            <i class="fa fa-angle-down"></i>
          </span>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
           </div>
		    <?php } ?>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
		<?php } ?>
		<?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?>
<div class="nv-right hidden-xs">
	<div class="navbar-fixed-top">
	<li><span class="glyphicon glyphicon-qrcode"></span><ul><img src="<?php echo $wxqr; ?>"/><p>【微信扫一扫】</p></ul></li>
	<li><span class="glyphicon glyphicon-phone"></span><ul><img src="<?php echo $mbqr; ?>"/><p>【前往手机站】</p></ul></li>
	<li><a title="<?php echo $text_contact_us; ?>" href="<?php echo $contact; ?>"><span class="glyphicon glyphicon-pencil"></span></a></li>
	<li class="go-top"><a onclick="pageScroll()"><span class="glyphicon glyphicon-eject"></span></a>
	</li>
	</div>
</div>