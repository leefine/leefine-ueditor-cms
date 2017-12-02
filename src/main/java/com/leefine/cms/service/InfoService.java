package com.leefine.cms.service;

import com.leefine.cms.dao.InfoMapper;
import com.leefine.cms.vo.AtlInfo;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class InfoService {

    @Autowired
    private InfoMapper infoMapper;

    public List<AtlInfo> getListPage(Map<String, Object> param) {
        if (param.get("pgids") != null && StringUtils.isNotBlank(param.get("pgids").toString()))
            param.put("pgidsList", param.get("pgids").toString().split(","));
        return infoMapper.getListPage(param);
    }

    public AtlInfo getByID(int id) {
        return infoMapper.getByID(id);

    }

    public void updatePV(int id) {
        infoMapper.updatePV(id);

    }

    public String getInfoCopyTreeIDS(int id) {
        List<Map<String, Object>> ls = infoMapper.getInfoCopyTreeIDS(id);
        String result = "";
        for (Map<String, Object> map : ls) {
            result += "," + map.get("cat_id").toString();
        }
        return result;
    }

    public String getInfoTreeMainID(int id) {
        return infoMapper.getInfoTreeMainID(id);
    }

    public void create(AtlInfo info, String ids, String ids_radio) {

        if (info.getId() > 0) {
            infoMapper.update(info);
            infoMapper.deleteInfoTree(info.getId());
            if (StringUtils.isNotEmpty(ids))
                infoMapper.createTree(ids.split(","), info.getId());
            infoMapper.createTreeMain(ids_radio, info.getId());
        } else {
            infoMapper.create(info);
            if (StringUtils.isNotEmpty(ids))
                infoMapper.createTree(ids.split(","), info.getId());
            infoMapper.createTreeMain(ids_radio, info.getId());
        }
    }

    public void update(AtlInfo supply) {
        infoMapper.update(supply);
    }

    public boolean delete(@Param("ids") String[] ids) {
        return infoMapper.delete(ids) > 0;
    }

    public List<Map<String, Object>> getTopN(int topN, String... pgids) {
        return infoMapper.getTopN(topN, pgids);
    }
}
