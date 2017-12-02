var powergridobj, powerGridCheckBoxData, objid, setting = {
	check : {
		enable : true,
		chkboxType : {
			// "Y" : "ps",
			"Y" : "s",
			"N" : "s"
		}
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		beforeClick : beforeClick,
		onCheck : onCheck
	},
	view : {
		showIcon : true,
		fontCss : setZTreeCSS
	}
};
function loadPowerGridTree(length) {
	length += 25;
	if ($("#menuContent").length <= 0) {
		$("body")
				.append(
						'<div id="menuContent" class="menuContent" style="display:none; position: absolute;z-index:9999;"><ul id="powerGrid" class="ztree" style="margin-top:0; width:'
								+ length + 'px;"></ul></div>');

	}
	$.fn.zTree.init($("#powerGrid"), setting, powerGridCheckBoxData);
}

function getPowerGridCheckBoxData() {
	var powerGridCheckBoxData_temp;
	$.ajax({
		async : false,
		cache : false,
		type : 'get',
		dataType : "json",
		url : relpath + "/cms_infotree/treenofilter",
		success : function(data) {
			powerGridCheckBoxData_temp = data;
		}
	});
	return powerGridCheckBoxData_temp;
}

function beforeClick(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("powerGrid");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}

function onCheck(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("powerGrid"), nodes = zTree
			.getCheckedNodes(true), v = "", cid = "";

	for (var i = 0, l = nodes.length; i < l; i++) {
		v += nodes[i].name + ",";
		cid += nodes[i].id + ",";
	}
	if (v.length > 0)
		v = v.substring(0, v.length - 1);

	if (cid.length > 0)
		cid = cid.substring(0, cid.length - 1);


	$("#" + objid).val(cid);
	$(powergridobj).val(v);
}

function hideMenu() {
	$("#menuContent").hide();
	$("body").unbind("mousedown", onBodyDown);
}

function onBodyDown(event) {
	if (!(event.target.id == "menuBtn"
			|| event.target.id == $(powergridobj).attr("id")
			|| event.target.id == "menuContent" || $(event.target).parents(
			"#menuContent").length > 0)) {
		hideMenu();
	}
}

function showMenu(obj, hddid) {
	objid = hddid;
	powergridobj = obj;
	powerGridCheckBoxData = getPowerGridCheckBoxData();
	loadPowerGridTree($(powergridobj).width());

	$("#menuContent").css(
			{
				left : $(powergridobj).offset().left + "px",
				top : $(powergridobj).offset().top
						+ $(powergridobj).outerHeight() + "px"
			}).show();

	selectNode("powerGrid", $("#" + objid).attr("value"));
	$("body").bind("mousedown", onBodyDown);
}
