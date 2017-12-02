<script type="text/javascript"  src="${relpath}/cms/ueditor/ueditor.config.js"></script>
<script type="text/javascript"  src="${relpath}/cms/ueditor/ueditor.all.js"> </script>
<script type="text/javascript"  src="${relpath}/cms/ueditor/lang/zh-cn/zh-cn.js"></script>
<form action="${relpath}/infotree/create" id="pgform" method="post"  class="form-horizontal">
    <input type="hidden" id="id" name="id" value="${pg.id}">
    <input type="hidden" id=pid name="pid" value="${pgid}">
    <div class="form-group">
        <label class="col-sm-3 control-label redstar"><fmt:message
                key="name" bundle="${common}"/></label>
        <div class="col-sm-3">
            <input id="name" name="name" type="text" value="${pg.name}"
                   maxlength="50" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label redstar"> <fmt:message
                key="status" bundle="${common}"/></label>
        <div class="col-sm-3">
            <select id="status" name="status" class="form-control">
                <c:forEach var="entry" items="${statusList}">
                    <option value="${entry.key}"
                        ${pg.status == entry.key ? "selected":""}>${entry.value}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label"> 主菜单 </label>
        <div class="col-sm-3">
            <select name="ifmainmenu" class="form-control">
                <option  value="0" ${pg.ifmainmenu==0?'selected="selected"':''}>是
                </option>
                <option value="1" ${pg.ifmainmenu==1?'selected="selected"':''}>否</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label"> 页面类型 </label>
        <div class="col-sm-3">
            <select name="pagetype" class="form-control">
                <option
                        value="0" ${pg.pagetype==0?'selected="selected"':''}>标题列表
                </option>
                <option value="1"
                ${pg.pagetype==1?'selected="selected"':''}>单页
                </option>
                <option value="2"
                ${pg.pagetype==2?'selected="selected"':''}>图片列表
                </option>
                <option value="3"
                ${pg.pagetype==3?'selected="selected"':''}>友情链接
                </option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label"> <fmt:message
                key="description" bundle="${common}"/>
        </label>
        <div class="col-sm-8"><textarea id="descr" name="descr" style="width: 100%; height: 300px">${pg.descr }</textarea>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-3">
            <input type="submit" id="create"
                   value="<fmt:message key="Save" bundle="${common}"/>"
                   class="btn btn-info bottom-margin"/> <input
                class="btn btn-default" type="reset"
                value="<fmt:message key="Cancel" bundle="${common}"/>">
        </div>
    </div>
</form>
<script>
    $(function () {
        var ue = UE.getEditor('descr');
        $('#pgform').validate({
            rules: {
                name: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                }
            }
        });
        if ('${refreshtree}' == '1') {
            window.parent.refreshTree();
        }
    });
</script>