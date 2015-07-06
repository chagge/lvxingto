<footer style="background-color:<?php echo $footer_backgounrd; ?>">
  <div class="container">
	<?php echo $hr; ?>
    <div class="row hidden-xs">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5 style="color: <?php echo $text_color; ?>"><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a style="color: <?php echo $text_color; ?>" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5 style="color: <?php echo $text_color; ?>"><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a style="color: <?php echo $text_color; ?>" href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a style="color: <?php echo $text_color; ?>" href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a style="color: <?php echo $text_color; ?>" href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5 style="color: <?php echo $text_color; ?>"><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a style="color: <?php echo $text_color; ?>" href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a style="color: <?php echo $text_color; ?>" href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a style="color: <?php echo $text_color; ?>" href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5 style="color: <?php echo $text_color; ?>"><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a style="color: <?php echo $text_color; ?>" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a style="color: <?php echo $text_color; ?>" href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a style="color: <?php echo $text_color; ?>" href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a style="color: <?php echo $text_color; ?>" href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p style="color: <?php echo $text_color; ?>"><?php echo $powered; ?></p>
    <p>
    <a href="http://zhanzhang.anquan.org/physical/report/?domain=www.lvxingto.com" target="_black" name="O5CLkrUuue6fQA04FkdCUdRlDG8crjUwsQSMe5VabeFBBI9TEm"><img height="25" src="<?php echo $zhanzhang; ?>"alt="安全联盟站长平台" /></a>
    <a href="http://www.12377.cn/?spm=1.7274553.1997523009.42.9PsuPF" target="_black"><img height="25" src="<?php echo $jubao_ico;?>"alt="<?php echo $text_jubao; ?>" /></a>
    <a href="https://ss.knet.cn/verifyseal.dll?sn=i15051953000000351413439271&comefrom=trust&trustKey=dn&trustValue=www.lvxingto.com" target="_black"><img height="25" src="<?php echo $kexin_ico;?>"alt="<?php echo $text_kexin; ?>" /></a>
    </p>
  </div>
</footer>
</body></html>