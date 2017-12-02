<%@ include file="/WEB-INF/view/comm/header_ifm.jsp"%>
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
		<%@ include file="form.jsp" %>
	</div>
</div>
<%@ include file="/WEB-INF/view/comm/footer_ifm.jsp"%>