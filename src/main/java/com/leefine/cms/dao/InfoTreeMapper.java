package com.leefine.cms.dao;

import com.leefine.cms.vo.AtlCat;
import com.sanxing.epower.core.dao.SuperMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;



public interface InfoTreeMapper extends SuperMapper {

	public List<AtlCat> getTreeList(Map<String, Object> param);

	public List<AtlCat> getListPage(Map<String, Object> param);

	public AtlCat getByID(int id);

	public void create(AtlCat powerGrid);

	public void update(AtlCat powerGrid);

	public void delete(@Param("ids") int[] ids);

	public int ifHasChild(int id);

	public int exist(Map<String, Object> param);

	public List<Map<String, Object>> getSonListByID(int id);

	public List<Map<String, Object>> getDirSonListByID(int id);

	public List<Map<String, Object>> getDirSonListByIDWithoutSinglePage(int id);

	public List<Map<String, Object>> getParentListByID(int id);

	public List<Map<String, Object>> getMainMenuByID(int id);

}
