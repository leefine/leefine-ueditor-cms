package com.leefine.cms.service;

import com.leefine.cms.dao.InfoTreeMapper;
import com.leefine.cms.vo.AtlCat;
import com.sanxing.epower.core.util.page.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class InfoTreeService {

	@Autowired
	private InfoTreeMapper powerGridMapper;

	public List<AtlCat> getTreeList(int user_id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("user_id", user_id);
		return powerGridMapper.getTreeList(param);
	}

	public List<AtlCat> getListPage(int id,  Pager page) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("page", page);
		param.put("id", id);
		return powerGridMapper.getListPage(param);
	}

	public AtlCat getByID(int id) {
		return powerGridMapper.getByID(id);
	}

	public void create(AtlCat powerGrid) {
		powerGridMapper.create(powerGrid);
	}

	public void update(AtlCat powerGrid) {
		powerGridMapper.update(powerGrid);
	}

	public boolean delete(int[] ids, StringBuilder sb) {

		if (sb.length() == 0) {
			powerGridMapper.delete(ids);
			return true;
		} else {
			return false;
		}
	}

	public int ifHasChild(int id) {
		return powerGridMapper.ifHasChild(id);
	}

	public boolean exist(Map<String, Object> param) {
		return powerGridMapper.exist(param) == 0 ? false : true;
	}

	public List<Map<String, Object>> getSonListByID1(int id) {
		return powerGridMapper.getSonListByID(id);
	}

	public List<Map<String, Object>> getDirSonListByID(int id) {
		return powerGridMapper.getDirSonListByID(id);
	}

	public List<Map<String, Object>> getDirSonListByIDWithoutSinglePage(int id) {
		return powerGridMapper.getDirSonListByIDWithoutSinglePage(id);
	}

	public List<Map<String, Object>> getParentListByID(int id) {
		return powerGridMapper.getParentListByID(id);
	}

	public void resourceAccess(Map<String, Object> param) {
		if (null != param.get("pgid")) {
			int pgid = Integer.parseInt(param.get("pgid").toString());

			if (pgid != 0) {
				List<Map<String, Object>> pgidList = getSonListByID1(pgid);
				if (pgidList != null && pgidList.size() > 0)
					param.put("pgids", pgidList);
			}
		}
	}
}
