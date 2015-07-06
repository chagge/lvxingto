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
    <div id="content" class="<?php echo $class; ?>"><div class="ystep1"></div>
		<a id="verified" class="col-sm-6" href="<?php echo $personal_verified_url; ?>"><div class="verified-ico-widh">
		<li><i class="fa fa-male verified-ico"></i><span style="margin-left:10px">个人认证</span></li>
		<li>个人认证是指：经营主体不具备或不方便以企业资质提交认证，同时又能以技术、技能或其它资源提供服务的用户注册为商家。</li>
		<hr>
		<li>个人用户具备的权限：</li>
		<li>1、拥有自己独立的店铺</li>
		<li>2、出售规定内商品</li>
		<hr>
		<li class="verified-next">选择并继续<i class="fa fa-angle-double-right"></i></li>
		</div>
		</a>
		<a id="verified" class="col-sm-6" href="<?php echo $business_verified_url; ?>"><div class="verified-ico-widh">
		<li><i class="fa fa-user verified-ico"></i><span style="margin-left:10px">企业认证</span></li>
		<li>企业认证是指：经营主体以企业（公司/个体工商户）为审核单位，具备行业内从业资质，能提供一定质量服务的用户注册为商家。</li>
		<hr>
		<li>企业用户具备的权限：</li>
		<li>1、拥有自己独立的店铺</li>
		<li>2、出售规定内商品</li>
		<hr>
		<li class="verified-next">选择并继续<i class="fa fa-angle-double-right"></i></li>
		</div></a>
	</div>
    <?php echo $column_right; ?>
    </div><?php echo $content_bottom; ?>
</div>
<script>
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
        title: "商家资质",
        content: "企业类型提交后将不能修改"
      },{
        title: "审核",
        content: "工作人员将在7个工作日内对你的资质进行审核，请保持电话畅通！"
      },{
        title: "认证通过",
        content: "认证通过后你的开店功能开通"
      }]
    });
    $(".ystep1").setStep(2);
    
  </script>
<?php echo $footer; ?>