<%@ include file="/WEB-INF/view/comm/header.jsp"%>
<script type="text/javascript"  src="${relpath}/cms/ueditor/ueditor.config.js"></script>
<script type="text/javascript"  src="${relpath}/cms/ueditor/ueditor.all.js"> </script>
<script type="text/javascript"  src="${relpath}/cms/ueditor/lang/zh-cn/zh-cn.js"></script>
<fmt:setBundle basename="i18n/common" var="common"></fmt:setBundle>
<fmt:setBundle basename="i18n/archive" var="archive"></fmt:setBundle>
<div class="panel panel-default">
	<div class="panel-heading">
		<div class="title">
			${commPageVo.title}
			<div class="btn-group pull-right btn-icon">${goback}</div>
		</div>
	</div>
	<div class="panel-body">
		<form action="${relpath}/info/create" id="pgform" method="post"
			name="pgform" class="form-horizontal">
			<input id="id" name="id" type="hidden" value="${obj.id}" />
			<div class="form-group">
				<label class="col-sm-2 control-label redstar"> 分类</label>
				<div class="col-sm-2">
					<script src="${relpath }/cms/js/atl_cat_radio.js"></script>
					<input id="pg_radio" type="text" value="" autocomplete="off"
						placeholder="主分类" readonly="readonly"
						onclick="showMenu_radio(this,'treeIDS_radio');"
						class="form-control" /> <input id="treeIDS_radio"
						name="treeIDS_radio" type="hidden" value="${mainid}" />
				</div>
				<div class="col-sm-2">
					<script src="${relpath }/cms/js/atl_cat_checkbox.js"></script>
					<input id="pg" type="text" value="" autocomplete="off"
						placeholder="复制到分类" readonly="readonly"
						onclick="showMenu(this,'treeIDS');" class="form-control" /><input
						id="treeIDS" name="treeIDS" type="hidden" value="${ids}" />

				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label redstar"> 标题</label>
				<div class="col-sm-3">
					<input id="title" name="title" type="text" value="${obj.title }"
						maxlength="40" class="form-control" />
				</div>
				<div class="col-sm-1">
					<select name="titlecolor" class="form-control"><option
							value="" selected="selected">颜色</option>
						<option value="red" style="color: red">红色</option>
						<option value="blue" style="color: blue">蓝色</option>
						<option value="yellow" style="color: yellow">黄色</option>
						<option value="orange" style="color: orange">橙色</option></select>

				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label "> 主题图片</label>
				<div class="col-sm-4">
					<script type="text/plain" id="upload_ue"></script>
					<img alt="主题图片" src="${obj.picpath }" id="picUpload"
						onclick="upImage();" class="img-thumbnail" width="120px" /><input
						type="hidden" id="picpath" name="picpath" value="${obj.picpath }" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label ">作者</label>
				<div class="col-sm-4">
					<input id="author" name="author" type="text"
						value="${empty obj.author?CurrentUser.username:obj.author }"
						maxlength="10" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label redstar"> 内容</label>
				<div class="col-sm-8">
					<textarea id="descr" name="descr"
						style="width: 100%; height: 300px">${obj.descr }</textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-3">
					<input type="submit" id="create" value="保存"
						class="btn btn-info bottom-margin" /> <input
						class="btn btn-default" type="reset" value="取消">
				</div>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
	var ue = UE.getEditor('descr');
	var _editorPic = UE.getEditor('upload_ue');
	_editorPic.ready(function() {
		_editorPic.hide();
		_editorPic.addListener('beforeInsertImage', function(t, arg) {
			$("#picpath").attr("value", arg[0].src);
			$("#picUpload").attr("src", arg[0].src);
		})
	});
	//弹出图片上传的对话框
	function upImage() {
		var myImage = _editorPic.getDialog("insertimage");
		myImage.open();
	}

	$(function() {
		$('#pgform').submit(function() {
			UE.getEditor('descr').sync();
		}).validate({
			ignore : "",
			rules : {
				treeIDS_radio : {
					required : true
				},
				title : {
					required : true,
					maxlength : 40
				},
				descr : {
					required : true
				}
			}
		});

		showMenu($("#pg"), "treeIDS");
		selectNode("powerGrid", $("#treeIDS").val());
		hideMenu();

		showMenu_radio($("#pg_radio"), "treeIDS_radio");
		selectNode("powerGrid_radio", $("#treeIDS_radio").val());
		hideMenu_radio();
	});
</script>
<%@ include file="/WEB-INF/view/comm/footer.jsp"%>