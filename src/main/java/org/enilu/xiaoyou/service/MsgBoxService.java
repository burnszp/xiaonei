/**
 *MsgBoxService.java
 *Version1.0
 *2015-3-31
 *Copyright cnendata.com
 *
 */
package org.enilu.xiaoyou.service;

import java.util.List;

import org.enilu.xiaoyou.entity.MsgBox;
import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.IocBean;

/**
 * 短消息服务类<br>
 * <!--<br>
 * 历史记录：<br>
 * --------------------------------------------------------
 * 2015-3-31,enilu(82552623@qq.com)新建文档<br>
 * 
 * -->
 * 
 * @author enilu(82552623@qq.com)
 * 
 *         since1.0
 */
@IocBean
public class MsgBoxService extends GeneralService {

	public List<MsgBox> query(Long receiveUser) {
		return dao.query(MsgBox.class,
				Cnd.where("receiveUser", "=", receiveUser));
	}
}
