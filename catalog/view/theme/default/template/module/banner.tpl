<div id="banner<?php echo $module; ?>" class="owl-carousel">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img class="banner<?php echo $module; ?>" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img class="banner<?php echo $module; ?>" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#banner<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: false,
	pagination: false,
	transitionStyle: 'fade'
});
--></script>
<script type="text/javascript" charset="utf-8">
  $(function() {
      $("img.banner<?php echo $module; ?>").lazyload({
    	  event : "sporty",
    	  effect: "fadeIn",
    	  placeholder : "<?php echo $lazyload_img; ?>", //
    	  failurelimit : 10 //
    	  });
  });
  $(window).bind("load", function() {
	    var timeout = setTimeout(function() { $("img.banner<?php echo $module; ?>").trigger("sporty") }, 1);
	});
</script>