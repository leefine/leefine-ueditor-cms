package com.leefine.cms.dao;

import com.leefine.cms.vo.AtlInfo;
import com.sanxing.epower.core.dao.SuperMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface InfoMapper extends SuperMapper {

	public List<AtlInfo> getListPage(Map<String, Object> param);

	public AtlInfo getByID(int id);

	public List<Map<String, Object>> getInfoCopyTreeIDS(int id);

	public String getInfoTreeMainID(int id);

	public void create(AtlInfo supply);

	public void update(AtlInfo supply);

	public void createTree(@Param("ids") String[] ids, @Param("info_id") int info_id);

	public void createTreeMain(@Param("mainid") String mainid, @Param("info_id") int info_id);

	public int delete(@Param("ids") String[] ids);

	public void deleteInfoTree(int id);

	public List<Map<String, Object>> getTopNPic(@Param("n") int n, @Param("pgids") String[] pgids);

	public List<Map<String, Object>> getTopN(@Param("n") int n, @Param("pgids") String[] pgids);

	public List<Map<String, Object>> getTopNByID(@Param("n") int n, @Param("pgid") int pgid);

	public List<Map<String, Object>> getTopNOrderbyPV(@Param("n") int n);

	public List<Map<String, Object>> getTopNOrderbyCrton(@Param("n") int n);

	public void updatePV(int id);

}
