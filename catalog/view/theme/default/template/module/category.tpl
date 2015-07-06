<div class="list-group category-grout-nv">
	<?php foreach ($categories as $category) { ?>
		<?php if (!empty($category['name'])) { ?>
		<?php if (!empty($category['href'])) { ?>
				<li>
				<?php if ($category['children']) { ?>
					<a class="list-group-item active arrow">
				<?php } else { ?>
					<a href="<?php echo $category['href']; ?>" class="list-group-item active arrow">
					
				<?php } ?>
				<?php echo $category['name']; ?>
				</a>
				<?php if ($category['children']) { ?>
					<ul>
						<?php foreach ($category['children'] as $child) { ?>
						<?php if (!empty($child['name'])) { ?><?php if (!empty($child['href'])) { ?>
						<a href="<?php echo $child['href']; ?>" class="list-group-item active">&nbsp;<i class="fa fa-angle-double-right"></i>&nbsp;<?php echo $child['name']; ?></a>
						<?php } else { ?>
						<a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;<i class="fa fa-angle-double-right"></i>&nbsp;<?php echo $child['name']; ?></a>
						<?php } ?>
						<?php } ?>
						<?php } ?>
					</ul>
				<?php } ?>
				<?php } else { ?>
				<a href="<?php echo $category['href']; ?>" class="list-group-item arrow"><?php echo $category['name']; ?></a>
			</li>
		<?php } ?>
		<?php } ?>
	<?php } ?>
 </div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.category-grout-nv').find("li").has("ul").children('a').on('click', function() {
		if($('.category-grout-nv').find("li").has("ul")){
			$(this).toggleClass('open').toggleClass('arrow').parent('li').children('ul').collapse('toggle');
			$(this).siblings().removeClass('open').parent('li').children('ul.in').collapse('hide');
		}
	});
});
--></script>