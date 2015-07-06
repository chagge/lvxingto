<h3><?php echo $heading_title; ?></h3>
<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="col-lg-12 col-md-3 col-sm-12 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img class="product-thumb-latest" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <span class="pay-number"><?php echo $product['product_payment_total']; ?></span>
        </p>
        <?php } ?>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
<script type="text/javascript" charset="utf-8">
  $(function() {
      $("img.product-thumb-latest").lazyload({
    	  effect: "fadeIn",
    	  placeholder : "<?php echo $product_lazyload; ?>", //
    	  failurelimit : 10 // 
    	  });
  });
</script>
