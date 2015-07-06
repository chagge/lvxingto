<?php echo $header; ?>
<div class="container">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
  <div class="row">
	<div class="col-sm-12"><?php echo $content_top; ?></div>
	<?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><div class="ystep1 hidden-xs"></div><h3 class="visible-xs verified-data-submit">选择认证类型</h3>
    	<form id="verified_personal" class="form-verified-type" action="<?php echo $verified_action; ?>" method="post">
	    <input id="name" name="verified_type" type="hidden" value="1" /><br>
		</form>
		<a id="verified" class="col-sm-6 verified_personal"><div class="verified-ico-widh">
		<li><i class="fa fa-male verified-ico"></i><span style="margin-left:10px"><?php echo $text_personal_verified; ?></span></li>
		<li><?php echo $text_personal_explanation; ?></li>
		<hr>
		<?php echo $text_personal_content;?>
		<hr>
		<li class="verified-next"><?php echo $text_continue;?><i class="fa fa-angle-double-right"></i></li>
		</div>
		</a>
		<form id="verified_business" class="form-verified-type" action="<?php echo $verified_action; ?>" method="post">
	    <input id="name" name="verified_type" type="hidden" value="2" /><br>
		</form>
		<a id="verified" class="col-sm-6 verified_business"><div class="verified-ico-widh">
		<li><i class="fa fa-user verified-ico"></i><span style="margin-left:10px"><?php echo $text_business_verified; ?></span></li>
		<li><?php echo $text_business_explanation; ?></li>
		<hr>
		<?php echo $text_businese_content;?>
		<hr>
		<li class="verified-next"><?php echo $text_continue;?><i class="fa fa-angle-double-right"></i></li>
		</div></a>
	</div>
    <?php echo $column_right; ?>
    </div><?php echo $content_bottom; ?>
</div>
<script type="text/javascript">
    //根据jQuery选择器找到需要加载ystep的容器
    //loadStep 方法可以初始化ystep
    $(".ystep1").loadStep({
      //ystep的外观大小
      //可选值：small,large
      size: "large",
      //ystep配色方案
      //可选值：green,blue
      color: "green",
      //ystep中包含的步骤
      steps: [{
        //步骤名称
        title: "选择类型",
        //步骤内容(鼠标移动到本步骤节点时，会提示该内容)
        content: "请选择你的认证类型"
      },{
        title: "提交资质",
        content: "个人、企业类型提交后将不能修改"
      },{
        title: "审核",
        content: "工作人员将在7个工作日内对你的资质进行审核，请保持电话畅通！"
      },{
        title: "认证通过",
        content: "认证通过后你的开店功能开通"
      }]
    });
    $(".ystep1").setStep(1);
  </script>
<script type="text/javascript">
  //post提交数据
	$(document).ready(function(){
		$(".verified_personal").click(function(){
			$("#verified_personal").submit();
			});
		
		$(".verified_business").click(function(){
			$("#verified_business").submit();
			});
		});
</script>
<?php echo $footer; ?>