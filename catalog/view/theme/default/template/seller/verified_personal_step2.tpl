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
    <div id="content" class="<?php echo $class; ?>"><div class="ystep1 hidden-xs"></div><h3 class="visible-xs verified-data-submit"><?php echo $text_personal_class; ?></h3>
    	<form action="<?php echo $verified_action; ?>" method="post" enctype="multipart/form-data" id="verified-personal-form" class="col-sm-12">
    		<fieldset>
    		<legend><?php echo $text_userinfo;?></legend>
    		<div class="form-group">
                <label class="control-label" for="input-name"><span><?php echo $entry_name; ?></span></label>
                  <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
            </div>
            <div class="form-group">
                <label class="control-label" for="input-paperwork_type"><span><?php echo $entry_paperwork_type; ?></span></label>
                  <select id="select-paperwork_type" name="paperwork_type" title="Please select something!" class="form-control {required:true}">
                  <option value=""><?php echo $text_select_paperwork_type; ?></option>
                  <?php foreach ($select_paperwork_types as $select_paperwork_type) { ?>
                  	<?php if($select_paperwork_type['value']==$paperwork_type){?>
                  		<option value="<?php echo $select_paperwork_type['value']; ?>" selected="selected"><?php echo $select_paperwork_type['name']; ?></option>
                  	<?php } else { ?>
                  		<option value="<?php echo $select_paperwork_type['value']; ?>"><?php echo $select_paperwork_type['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
				  </select>
            </div>
            <div class="form-group">
                <label class="control-label" for="input-paperwork_number"><span><?php echo $entry_paperwork_number; ?></span></label>
                  <input type="text" name="paperwork_number" value="<?php echo $paperwork_number; ?>" placeholder="<?php echo $entry_paperwork_number; ?>" id="input-paperwork_number" class="form-control" />
            </div>
            <div class="form-group"><!--有效期-->
                <label class="control-label" for="input-validity"><span><?php echo $entry_validity; ?></span></label>
                <div class="input-group verified-date-input validity-start">
                  <input type="text" name="validity_start" value="<?php echo $validity_start; ?>" placeholder="<?php echo $entry_validity_start; ?>" data-date-format="YYYY-MM-DD" id="input-validity-start" class="form-control" /><span class="input-group-btn">
                <button type="button" class="btn btn-default verified-date"><i class="fa fa-calendar"></i></button>
                </span></div>
                <div class="input-group verified-date-input validity-end">
                  <input type="text" name="validity_end" value="<?php echo $validity_end; ?>" data-date-format="YYY-MM-DD" placeholder="<?php echo $entry_validity_end; ?>" id="input-validity-end" class="form-control" /><span class="input-group-btn">
                <button type="button" class="btn btn-default verified-date"><i class="fa fa-calendar"></i></button>
                </span>
                </div>
            </div>
            <div class="form-group verified-card">
                <label class="control-label verified-img-title" for="input-positive-card"><span><?php echo $entry_positive_card; ?></span></label>
                  <div id="verified-card"><img id="verified-card-preview" src="<?php echo $positive_card_img; ?>" class="verified-img-card"></div>
                  <input type="file" name="positive_card" id="input-positive-card" onchange="javascript:setImagePreview();"/>
            </div>
            <div class="form-group verified-card">
                <label class="control-label verified-img-title" for="input-back-card"><span><?php echo $entry_back_card; ?></span></label>
                <img src="<?php echo $back_card; ?>" class="verified-img-card">
                <input type="file" name="back_card" id="input-back-card"/>
            </div>
            <div class="form-group verified-card">
                <label class="control-label verified-img-title" for="input-holding-card"><span><?php echo $entry_holding_card; ?></span></label>
                <img src="<?php echo $holding_card; ?>" class="verified-img-card">
                <input type="file" name="holding_card" id="input-holding-card"/>
            </div>
            </fieldset>
            <fieldset>
    		<legend><?php echo $text_bankinfo;?></legend>
    			<div class="form-group">
                <label class="control-label" for="input-bank"><span><?php echo $entry_bank; ?></span></label>
                  <input type="text" name="bank" value="<?php echo $bank; ?>" placeholder="<?php echo $entry_bank; ?>" id="input-bank" class="form-control" />
            </div>
            <div class="form-group">
                <label class="control-label" for="input-bank_address"><span><?php echo $entry_bank_address; ?></span></label>
                  <input type="text" name="bank_address" value="<?php echo $bank_address; ?>" placeholder="<?php echo $entry_bank_address; ?>" id="input-bank_address" class="form-control" />
            </div>
            <div class="form-group">
                <label class="control-label" for="input-bank_number"><span><?php echo $entry_bank_number; ?></span></label>
                  <input type="text" name="bank_number" value="<?php echo $bank_number; ?>" placeholder="<?php echo $entry_bank_number; ?>" id="input-bank_number" class="form-control" />
            </div>
            <div class="form-group" style="width: 100%;float:left">
            <label style="width: 100%" class="control-label" for="input-captcha"><span><?php echo $text_captcha; ?></span></label>
          		<div style="float: left;width: 70%">
                <input type="text" name="captcha" value="<?php echo $captcha; ?>" placeholder="<?php echo $text_captcha; ?>" id="input-captcha" class="form-control" />
                </div>
                <div calss="col-sm-3">
                <img class="captcha-img" src="<?php echo $captcha_url.'&zoom=1.9';?>" onclick= "this.src='<?php echo $captcha_url.'&zoom=1.9';?>'+Math.random()" style="cursor: pointer; vertical-align:middle" title="看不清？点击更换！"/>
            </div>
          </div>
    		</fieldset>
    		<hr>
            <div class="form-group col-sm-12">
        		<input type="submit" value="<?php echo $button_submit; ?>" class="btn btn-primary col-sm-2" style="float: right"/>
        	</div>
    	</form>
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
        title: "个人资质",
        content: "个人类型提交后将不能修改"
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
<script type="text/javascript">
$('.validity-start').datetimepicker({
	pickTime: false
});
$(".validity-end").datetimepicker({
		pickTime: false
    });
</script>
<!--
<script type="text/javascript">
//正面图
//下面用于图片上传预览功能
function setImagePreview(avalue) {
var docObj=document.getElementById("input-positive-card");
 
var imgObjPreview=document.getElementById("verified-card-previewverified-card-preview");
if(docObj.files &&docObj.files[0])
{
//火狐下，直接设img属性
imgObjPreview.style.display = 'block';
imgObjPreview.style.width = '150px';
imgObjPreview.style.height = '180px'; 
//imgObjPreview.src = docObj.files[0].getAsDataURL();
 
//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
}
else
{
//IE下，使用滤镜
docObj.select();
var imgSrc = document.selection.createRange().text;
var localImagId = document.getElementById("verified-card");
//必须设置初始大小
localImagId.style.width = "150px";
localImagId.style.height = "180px";
//图片异常的捕捉，防止用户修改后缀来伪造图片
try{
localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
}
catch(e)
{
alert("您上传的图片格式不正确，请重新选择!");
return false;
}
imgObjPreview.style.display = 'none';
document.selection.empty();
}
return true;
}
</script>
-->
<?php echo $footer; ?>