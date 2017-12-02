package com.leefine.cms.controller;


import com.leefine.cms.service.InfoTreeService;
import com.leefine.cms.vo.AtlCat;
import com.sanxing.epower.core.controller.BaseController;
import com.sanxing.epower.core.util.GlobalUtil;
import com.sanxing.epower.core.util.I18nUtil;
import com.sanxing.epower.core.util.OperatingLogType;
import com.sanxing.epower.core.util.page.Pager;
import com.sanxing.epower.core.vo.JsonBaseVo;
import com.sanxing.epower.core.vo.TreeNode;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/*import net.sf.json.JSONArray;
 import net.sf.json.JSONObject;*/

@Controller
@RequestMapping("cms_infotree")
public class InfoTreeController extends BaseController {

    @Autowired
    private InfoTreeService powerGridService;

    @RequestMapping("index")
    public String index() {
        return "/cms/infotree/tree";
    }

    @RequestMapping("treenofilter")
    public
    @ResponseBody
    List<TreeNode> treeNoFilter(String click) {
        List<AtlCat> lsind = powerGridService.getTreeList(getCurrentUser().getId());
        List<TreeNode> nodeList = new ArrayList<TreeNode>();
        {
            TreeNode node = new TreeNode();
            node.setId("0");
            node.setpId("0");
            node.setName(GlobalUtil.TREE_ROOT);
            if (StringUtils.isNotBlank(click) && click.equals("true"))
                node.setClick("pgClick('0')");
            node.setOpen("true");
            node.setIcon(getRelPath() + GlobalUtil.POWER_GRID_IMG + "root.png");
            node.setNocheck("true");
            nodeList.add(node);
        }
        for (AtlCat a : lsind) {
            TreeNode node = new TreeNode();
            node.setId(String.valueOf(a.getId()));
            node.setpId(String.valueOf(a.getPid()));
            node.setName(a.getName());
            if (StringUtils.isNotBlank(click) && click.equals("true"))
                node.setClick("pgClick('" + a.getId() + "')");
            nodeList.add(node);
        }

        return nodeList;
    }

    @RequestMapping("index/{id}")
    public String powerGridListPage(@PathVariable int id, @RequestParam(defaultValue = "1") int p, String refreshtree,
                                    Model md) {
        md.addAttribute("statusList", baseDataService.getList("DataStatus"));
        Pager pager = new Pager(p, getRelPath() + "/infotree/index/" + id, "crton");
        List<AtlCat> ls = powerGridService.getListPage(id, pager);
        md.addAttribute("list", ls);
        md.addAttribute("pager", pager);
        md.addAttribute("refreshtree", refreshtree);
        AtlCat currentPG = powerGridService.getByID(id);
        md.addAttribute("pg", currentPG);
        return "/cms/infotree/index";
    }

    @RequestMapping("create/{id}")
    public String create(@PathVariable int id, Model md) {
        md.addAttribute("statusList", baseDataService.getList("DataStatus"));
        md.addAttribute("pgid", id);
        return "/cms/infotree/create";
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(AtlCat powerGrid) {
        setCRTOrMDF(powerGrid, getCurrentUser());
        if (powerGrid.getId() == 0) {
            powerGridService.create(powerGrid);
            setOperatingLogDescr("Create Power Grid Object:" + powerGrid.getName(), OperatingLogType.Create);
            return "redirect:/cms_infotree/index/" + powerGrid.getPid() + "?refreshtree=1";
        } else {
            powerGridService.update(powerGrid);
            setOperatingLogDescr("Update Power Grid Object:" + powerGrid.getName(), OperatingLogType.Update);
            return "redirect:/cms_infotree/index/" + powerGrid.getId() + "?refreshtree=1";
        }
    }

    @RequestMapping("delete")
    @ResponseBody
    public JsonBaseVo<String> delete(String para) {
        JsonBaseVo<String> jr = new JsonBaseVo<String>();
        jr.setErrorCode(1);// .setSuccess(false);

        try {
            String[] ckid = para.split(",");
            for (String s : ckid) {
                if (StringUtils.isNotBlank(s)) {
                    if (powerGridService.ifHasChild(Integer.parseInt(s)) > 0) {
                        jr.setErrorMsg(I18nUtil.getMessage("i18n.archive", "exist_child_nodes"));
                        return jr;
                    } else {
                        StringBuilder sb = new StringBuilder();
                        if (powerGridService.delete(new int[]{Integer.parseInt(s)}, sb)) {
                            jr.setErrorCode(0);
                            jr.setData(I18nUtil.getMessage("i18n.common", "delsuccess"));
                            setOperatingLogDescr("Delete Power Grid ID:" + para, OperatingLogType.Update);
                        } else {
                            jr.setErrorMsg(sb.toString());
                            return jr;
                        }
                    }
                }
            }
        } catch (Exception e) {
            jr.setErrorMsg(e.getMessage());
        }

        return jr;
    }
}
