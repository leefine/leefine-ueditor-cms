package com.leefine.cms.controller;


import com.leefine.cms.service.InfoService;
import com.leefine.cms.vo.AtlInfo;
import com.sanxing.epower.core.controller.BaseController;
import com.sanxing.epower.core.util.I18nUtil;
import com.sanxing.epower.core.util.OperatingLogType;
import com.sanxing.epower.core.util.page.Pager;
import com.sanxing.epower.core.vo.JsonBaseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("cms_info")
public class InfoController extends BaseController {

    @Autowired
    private InfoService infoService;

    @RequestMapping("index")
    public String index(@RequestParam(defaultValue = "1") int p, @RequestParam(defaultValue = "") String kw,
                        @RequestParam(defaultValue = "") String type, Model md) {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("kw", kw);
        param.put("pgids", type);
        Pager pager = new Pager(p, getRelPath() + "/info/index", "crton desc", param);
        param.put("page", pager);
        param.put("user_id", getCurrentUser().getId());
        List<AtlInfo> ls = infoService.getListPage(param);
        md.addAttribute("list", ls);
        md.addAllAttributes(param);
        return "/cms/info/index";
    }

    @RequestMapping("create")
    public String create() {
        return "/cms/info/create";
    }

    @RequestMapping("edit/{id}")
    public String edit(@PathVariable int id, Model md) {
        md.addAttribute("mainid", infoService.getInfoTreeMainID(id));
        md.addAttribute("ids", infoService.getInfoCopyTreeIDS(id));
        md.addAttribute("obj", infoService.getByID(id));
        return "/cms/info/create";
    }

    @PostMapping("create")
    public String create(AtlInfo info, String treeIDS, String treeIDS_radio) {
        setCRTOrMDF(info, getCurrentUser());
        infoService.create(info, treeIDS, treeIDS_radio);
        return "redirect:/cms_info/index";
    }

    @RequestMapping("delete")
    @ResponseBody
    public JsonBaseVo<String> delete(String para) {
        JsonBaseVo<String> jr = new JsonBaseVo<String>();
        jr.setErrorCode(1);

        try {
            StringBuilder sb = new StringBuilder();
            if (infoService.delete(para.split(","))) {
                jr.setErrorCode(0);
                jr.setData(I18nUtil.getMessage("i18n.common", "delsuccess"));
                setOperatingLogDescr("Delete Info ID:" + para, OperatingLogType.Delete);
            } else {
                jr.setErrorMsg(sb.toString());
            }
        } catch (Exception e) {
            jr.setErrorMsg(e.getMessage());
        }
        return jr;
    }
}
