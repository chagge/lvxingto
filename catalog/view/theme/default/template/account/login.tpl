<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> login-content">
      <div class="row">
        <div class="col-sm-7 hidden-xs">
          <?php echo $content_top; ?>
        </div>
        <div class="col-sm-5">
          <div class="well">
          <div class="row">
          	<p class="col-sm-6 hidden-xs"><?php echo $text_returning_customer; ?></p>
            <p class="col-sm-6 login-right-title"><?php echo $text_i_am_returning_customer; ?></p>
          </div>
			<?php if ($success) { ?>
			  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
			  <?php } ?>
			  <?php if ($error_warning) { ?>
			  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
			  <?php } ?>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
              <div class="form-group">
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              </div>
              <div class="form-group captcha-module">
                <input type="text" name="captcha" value="<?php echo $captcha; ?>" placeholder="<?php echo $text_captcha; ?>" id="input-captcha" class="form-control form-captcha" /><img class="captcha-img" src="<?php echo $captcha_url.'&zoom=2.3';?>" onclick= "this.src='<?php echo $captcha_url.'&zoom=2.3';?>'+Math.random()" style="cursor: pointer; vertical-align:middle" title="看不清？点击更换！"/>
              </div>
              <div class="form-group">
              <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
              </div>
              <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
              <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </form>
          </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
	</div>
</div>
<?php echo $footer; ?>