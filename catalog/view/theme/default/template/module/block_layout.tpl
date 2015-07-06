<?php if ($modules['left_modules']) { ?>
<column id="column-left" class="col-sm-3 hidden-xs">
  <?php foreach ($modules['left_modules'] as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</column>
<?php } ?>

<?php if ($modules['left_modules'] && $modules['right_modules']) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($modules['left_modules'] || $modules['right_modules']) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
<div class="<?php echo $class; ?>">
<?php if(!empty($modules['top_modules'])) { ?>
	<?php foreach ($modules['top_modules'] as $module) { ?>
	<?php echo $module; ?>
	<?php } ?>
<?php } ?>
</div>

<?php if ($modules['right_modules']) { ?>
<column id="column-right" class="col-sm-3 hidden-xs">
  <?php foreach ($modules['right_modules'] as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</column>
<?php } ?>