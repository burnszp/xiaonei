package org.enilu.xiaoyou.service;

import org.enilu.xiaoyou.entity.admin.AdminUser;
import org.nutz.dao.Cnd;

/**
 * descript
 * <p>
 * 2015年3月22日
 * <p>
 * 
 * @author burnszp(357252539@qq.com)
 * 
 * 
 */
public class AdminService extends GeneralService {

	/**
	 * @param loginName
	 * @param password
	 * @return
	 */
	public AdminUser login(String loginName, String password) {
		AdminUser user = dao.fetch(
				AdminUser.class,
				Cnd.where("loginName", "=", loginName).and("password", "=",
						password));

		return user;
	}

}
