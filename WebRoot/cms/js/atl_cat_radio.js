var powergridobj_radio, powerGridCheckBoxData_radio, objid_radio, setting_radio = {
	check : {
		enable : true,
		chkStyle : "radio",
		radioType : "all"
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		onClick : onClick_radio,
		onCheck : onCheck_radio
	},
	view : {
		showIcon : true,
		fontCss : setZTreeCSS
	}
};
function loadPowerGridTree_radio(length) {
	length += 25;
	if ($("#menuContent_radio").length <= 0) {
		$("body")
				.append(
						'<div id="menuContent_radio" class="menuContent" style="display:none; position: absolute;z-index:9999;"><ul id="powerGrid_radio" class="ztree" style="margin-top:0; width:'
								+ length + 'px;"></ul></div>');
	}
	$.fn.zTree.init($("#powerGrid_radio"), setting_radio,
			powerGridCheckBoxData_radio);
}

function getPowerGridCheckBoxData_radio() {
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

function onClick_radio(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("powerGrid_radio");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}

function onCheck_radio(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("powerGrid_radio");
	var nodes = zTree.getCheckedNodes(true);
	$("#" + objid_radio).val(nodes[0].id);
	$(powergridobj_radio).val(nodes[0].name);
}

function hideMenu_radio() {
	$("#menuContent_radio").hide();// .fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown_radio);
}

function onBodyDown_radio(event) {
	if (!(event.target.id == $(powergridobj_radio).attr("id")
			|| event.target.id == "menuContent_radio" || $(event.target)
			.parents("#menuContent_radio").length > 0)) {
		hideMenu_radio();
	}
}

function showMenu_radio(obj, hddID) {
	objid_radio = hddID;
	powergridobj_radio = obj;
	powerGridCheckBoxData_radio = getPowerGridCheckBoxData_radio();
	loadPowerGridTree_radio($(powergridobj_radio).width());

	$("#menuContent_radio").css(
			{
				left : $(powergridobj_radio).offset().left + "px",
				top : $(powergridobj_radio).offset().top
						+ $(powergridobj_radio).outerHeight() + "px"
			}).show();

	selectNode("powerGrid_radio", $("#" + objid_radio).attr("value"));
	$("body").bind("mousedown", onBodyDown_radio);
}
