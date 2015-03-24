package org.enilu.xiaoyou.service;

import java.util.List;

import org.enilu.xiaoyou.entity.Region;
import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.IocBean;

/**
 * 地区管理service
 * <p>
 * 2014年11月24日
 * <p>
 * 
 * @author enilu(82552623@qq.com)
 * 
 * 
 */
@IocBean
public class RegionService extends GeneralService {
	/**
	 * 查询所有省份
	 * 
	 * @return
	 */
	public List<Region> queryProvince() {
		return dao.query(Region.class, Cnd.where("id", "like", "%0000"));
	}

	/**
	 * 根据省份id查询该省份下的城市列表
	 * 
	 * @param pid
	 *            省份id
	 * @return
	 */
	public List<Region> queryCityByPid(Long pid) {
		return dao.query(Region.class,
				Cnd.where("id", "like", pid.toString().substring(0, 2) + "%")
						.and("id", "<>", pid));

	}

}
