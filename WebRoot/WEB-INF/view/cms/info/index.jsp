<%@ include file="/WEB-INF/view/comm/header.jsp"%>
<fmt:setBundle basename="i18n/common" var="common"></fmt:setBundle>
<fmt:setBundle basename="i18n/system" var="system"></fmt:setBundle>
<div class="panel panel-default">
	<div class="panel-heading">
		<div class="title">${commPageVo.title}
			<div class="btn-group pull-right btn-icon">
				<a class="btn btn-xs btn-default icon-add"
					title="<fmt:message key="Create" bundle="${common}"/>"
					href="create" data-btnid="35100"></a>
				<button class="btn btn-xs btn-default icon-delete"
					title="<fmt:message key="Delete" bundle="${common}"/>"
					onclick="delbch('delete','index')"  data-btnid="35102"></button>
			</div>
		</div>
	</div>
	<div class="panel-body">
		<form id="searchform" name="searchform" action="index"
			class="form-inline">
			<div class="form-group">
				<script type="text/javascript"
					src="${relpath }/cms/js/atl_cat_checkbox.js"></script>
				<input id="pg" type="text" value="" autocomplete="off"
					placeholder="分类选择" readonly="readonly"
					onclick="showMenu(this,'type');" class="form-control" /><input
					id="type" name="type" type="hidden" value="${pgids}" />
			</div>
			<div class="input-group col-sm-2">
				<input id="kw" name="kw" type="text"
					placeholder="<fmt:message key="name" bundle="${common}" />"
					class="form-control" value="${kw}" maxlength="50"> <span
					class="input-group-btn">
					<button id="search" type="submit"
						class="btn btn-default icon-search" value="search"></button>
				</span>
			</div>
		</form>
	</div>
	<table data-toggle="table">
		<thead>
			<tr>
				<th data-checkbox="true"></th>
				<th><fmt:message key="seqnumber" bundle="${common}" /></th>
				<th><fmt:message key="title" bundle="${system}" /></th>
				<th class="colhide780 "><fmt:message key="CreatedBy"
						bundle="${common}" /></th>
				<th class="colhide780"><fmt:message key="CreatedOn"
						bundle="${common}" /></th>
				<th class="th-act-3"><fmt:message key="Actions"
						bundle="${common}" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="od" items="${list}" varStatus="status">
				<tr data-id="${od.id}">
					<td></td>
					<td>${status.index + 1}</td>
					<td>${od.title}</td>
					<td class="colhide780"><div class="GetUserLink">${od.crtby}</div></td>
					<td class="colhide780"><fmt:formatDate value="${od.crton}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>
						<div class="btn-group">
							<a href="edit/${od.id}" class="btn btn-xs btn-default icon-edit"  data-btnid="35101"></a>
							  <a href="#"
								onclick="delbch('delete?para=${od.id}','index')"
								class="btn btn-xs btn-default icon-delete"  data-btnid="35102"></a>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="50" class="smallicon">${page.pageStr}</td>
			</tr>
		</tfoot>
	</table>
</div>
<script type="text/javascript">
	$(function() {
		showMenu($("#pg"), "type");
		selectNode("powerGrid", $("#type").val());
		hideMenu();
	});
</script>
<%@ include file="/WEB-INF/view/comm/footer.jsp"%>