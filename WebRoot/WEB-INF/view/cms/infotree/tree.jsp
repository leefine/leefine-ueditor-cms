<%@ include file="/WEB-INF/view/comm/header.jsp"%>
<fmt:setBundle basename="i18n/common" var="common"></fmt:setBundle>
<fmt:setBundle basename="i18n/archive" var="archive"></fmt:setBundle>
<div class="col-sm-3 no-padding-left">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="title">${commPageVo.title}
				<span class="mini-title"><fmt:message key="managementtree" bundle="${common}" /></span>
			</div>
		</div>
		<div class="panel-body">
			<ul id="powerGrid" class="ztree ztreeLeft"></ul>
		</div>
	</div>
</div>
<div class="col-sm-9 no-padding">
		<iframe id="RightFrame" name="RightFrame" width="100%" frameborder="0"
				src="${relpath}/cms_infotree/index/0"></iframe>
</div>
<script type="text/javascript" src="${relpath}/cms/js/atl_cat_tree.js"></script>
<script type="text/javascript">
	function pgClick(id) {
		$("#RightFrame").attr("src", "${relpath }/cms_infotree/index/" + id);
	}
	$(function() {
		loadZTree("powerGrid");
	});
</script>
<%@ include file="/WEB-INF/view/comm/footer.jsp"%>