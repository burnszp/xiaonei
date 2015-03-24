package org.enilu.xiaoyou.service;

import org.enilu.xiaoyou.entity.User;
import org.nutz.dao.Cnd;

/**
 * 用户管理service
 * <p>
 * 2014年9月27日
 * 
 * @author burnszp(357252539@qq.com)
 *         <p>
 */
public class UserService extends GeneralService {

	/**
	 * @param userName
	 * @param password
	 * @return
	 */
	public User login(String uname, String pwd) {
		User user = dao.fetch(User.class,
				Cnd.where("uname", "=", uname).and("pwd", "=", pwd));
		dao.fetchLinks(user, "college");
		return user;
	}

}
