<%@ include file="/WEB-INF/view/comm/header_ifm.jsp" %>
<fmt:setBundle basename="i18n/common" var="common"></fmt:setBundle>
<fmt:setBundle basename="i18n/archive" var="archive"></fmt:setBundle>
<div class="panel panel-default">
    <div class="panel-heading">
        <div class="title">${commPageVo.title}${bread }
            ${pg==null?"Root":pg.name}
            <div class="btn-group pull-right btn-icon">
                <a class="btn btn-xs btn-default icon-add"
                   href="${relpath}/infotree/create/${pg==null?0:pg.id}"></a>
                <button class="btn btn-xs btn-default icon-delete"
                        onclick="delbch('${relpath}/infotree/delete','${relpath}/infotree/index/0?refreshtree=1');"></button>
            </div>
        </div>
    </div>
    <div class="panel-body">
        <ul class="nav nav-tabs mytabs">
            <c:if test="${pg!=null }">
                <li><a href="#details" data-toggle="tab"><fmt:message
                        key="details" bundle="${common}"/></a></li>
            </c:if>
            <li class="active"><a href="#list" data-toggle="tab"><fmt:message
                    key="objectlist" bundle="${archive}"/></a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <br/>
            <c:if test="${pg!=null }">
                <div id="details" class="tab-pane fade">
                    <%@ include file="form.jsp" %>
                </div>
            </c:if>
            <c:if test="${list!=null}">
                <div id="list" class="tab-pane fade in active">
                    <table data-toggle="table" class="table-bordered">
                        <thead>
                        <tr>
                            <th data-checkbox="true"></th>
                            <th><fmt:message key="name" bundle="${common}"/></th>
                            <th class="colhide480"><fmt:message key="status"
                                                                bundle="${common}"/></th>
                            <th class="colhide780"><fmt:message key="CreatedBy"
                                                                bundle="${common}"/></th>
                            <th class="colhide780"><fmt:message key="CreatedOn"
                                                                bundle="${common}"/></th>
                            <th class="colhide780"><fmt:message key="ModifiedBy"
                                                                bundle="${common}"/></th>
                            <th class="colhide780"><fmt:message key="ModifiedOn"
                                                                bundle="${common}"/></th>
                            <th class="th-act-1"><fmt:message key="Actions"
                                                              bundle="${common}"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="supplier" items="${list}" varStatus="status">
                            <tr data-id="${supplier.id}">
                                <td></td>
                                <td><c:out value="${supplier.name}"/></td>
                                <td class="colhide480"><c:out
                                        value="${supplier.status==0?'Active':'Locked'}"/></td>
                                <td class="colhide780">
                                    <div class="GetUserLink">
                                        <c:out value="${supplier.crtby}"/>
                                    </div>
                                </td>
                                <td class="colhide780"><fmt:formatDate
                                        value="${supplier.crton}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td class="colhide780">
                                    <div class="GetUserLink">
                                        <c:out value="${supplier.mdfby}"/>
                                    </div>
                                </td>
                                <td class="colhide780"><fmt:formatDate
                                        value="${supplier.mdfon}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td><a href="#" class="btn btn-xs btn-default icon-delete"
                                       onclick="delbch('${relpath}/infotree/delete?para=${supplier.id}','${relpath}/infotree/index/${pg eq null?0:pg.id}?refreshtree=1')"></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="50" class="smallicon">${pager.pageStr}</td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </c:if>
        </div>
    </div>
</div>
<script>
    $(function () {
        if ('${refreshtree}' == '1') {
            window.parent.refreshTree();
        }
    });
</script>
<%@ include file="/WEB-INF/view/comm/footer_ifm.jsp" %>