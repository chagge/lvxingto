<div id="carousel<?php echo $module; ?>" class="owl-carousel">
  <?php foreach ($banners as $banner) { ?>
  <div class="item text-center">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img class="carousel<?php echo $module; ?>" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img class="carousel<?php echo $module; ?>" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#carousel<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
});
--></script>
<script type="text/javascript" charset="utf-8">
  $(function() {
      $("img.carousel<?php echo $module; ?>").lazyload({
    	  event : "sporty",
    	  effect: "fadeIn",
    	  placeholder : "<?php echo $lazyload_img; ?>", //��ͼƬ��ǰռλ
    	  failurelimit : 10 // ͼƬ�������ʱ
    	  });
  });
  $(window).bind("load", function() {
	    var timeout = setTimeout(function() { $("img.carousel<?php echo $module; ?>").trigger("sporty") }, 1);
	});
</script>