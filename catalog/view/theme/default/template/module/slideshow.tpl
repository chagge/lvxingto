<div id="slideshow<?php echo $module; ?>" class="owl-carousel style-full-cc" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img class="slideshow<?php echo $module; ?>" src="<?php echo $lazyloadgif; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img class="slideshow<?php echo $module; ?>" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
});
--></script>
<script type="text/javascript" charset="utf-8">
  $(function() {
      $("img.slideshow<?php echo $module; ?>").lazyload({
    	  event : "sporty",
    	  effect: "fadeIn",
    	  placeholder : "<?php echo $lazyload_img; ?>", //��ͼƬ��ǰռλ
    	  failurelimit : 10 // ͼƬ�������ʱ
    	  });
  });
  $(window).bind("load", function() {
	    var timeout = setTimeout(function() { $("img.slideshow<?php echo $module; ?>").trigger("sporty") }, 1);
	});
</script>