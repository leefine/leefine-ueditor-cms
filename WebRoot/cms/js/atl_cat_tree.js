var zTreeID, selectNodeID, selectNodeID_IsOpen, ztree_data, settingZTree = {
	check : {
		enable : false,
		chkDisabledInherit : true
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		onClick : onZTreeClick
	},
	view : {
		showIcon : true,
		fontCss : setZTreeCSS
	}
};

function onZTreeClick(e, treeId, treeNode) {
	selectNodeID = treeNode.id;
	var zTree = $.fn.zTree.getZTreeObj(treeId);
	if (treeNode.isParent)
		zTree.expandNode(treeNode);
	selectNodeID_IsOpen = treeNode.open;
}

function refreshTree() {
	ztree_data = null;
	loadZTree(zTreeID);
	var zTree = $.fn.zTree.getZTreeObj(zTreeID);
	var node = zTree.getNodeByParam("id", selectNodeID, null);
	zTree.selectNode(node, false);
	if (node.isParent && selectNodeID_IsOpen)
		zTree.expandNode(node);
}

function getZtreeData() {
	var getData;
	$.ajax({
		async : false,
		cache : false,
		type : 'get',
		dataType : "json",
		url : relpath + "/cms_infotree/treenofilter?click=true",
		success : function(data) {
			getData = data;
		}
	});
	return getData;
}

function loadZTree(treeID) {
	zTreeID = treeID;
	if (ztree_data == null)
		ztree_data = getZtreeData();
	$.fn.zTree.init($("#" + zTreeID), settingZTree, ztree_data);
}
