/**
 *InitService.java
 *Version1.0
 *2015-1-25
 *Copyright cnendata.com
 *
 */
package org.enilu.xiaoyou.service;

import org.enilu.xiaoyou.entity.College;
import org.enilu.xiaoyou.entity.Group;
import org.enilu.xiaoyou.entity.Message;
import org.enilu.xiaoyou.entity.MsgType;
import org.enilu.xiaoyou.entity.Region;
import org.enilu.xiaoyou.entity.User;
import org.nutz.ioc.loader.annotation.IocBean;

/**
 * 初始化service<br>
 * <!--<br>
 * 历史记录：<br>
 * --------------------------------------------------------
 * 2015-1-25,enilu(82552623@qq.com)新建文档<br>
 * 
 * -->
 * 
 * @author enilu(82552623@qq.com)
 * 
 *         since1.0
 */
@IocBean
public class InitService extends GeneralService {
	public void init() {
		dao.create(College.class, false);
		dao.create(Group.class, false);
		dao.create(MsgType.class, false);
		dao.create(Message.class, false);
		dao.create(Region.class, false);
		dao.create(User.class, false);
	}
}
