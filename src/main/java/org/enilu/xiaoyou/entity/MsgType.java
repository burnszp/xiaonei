package org.enilu.xiaoyou.entity;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * 消息类型实体
 * <p>
 * 2014年11月24日
 * 
 * @author enilu(82552623@qq.com)
 *         <p>
 */
@Table("fr_msgtype")
public class MsgType {
	@Id
	private Long id;
	@Column
	private String name;
	@Column
	private String descript;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

}
