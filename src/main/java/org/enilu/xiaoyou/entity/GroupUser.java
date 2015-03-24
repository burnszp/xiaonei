package org.enilu.xiaoyou.entity;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * descript
 * <p>
 * 2015年3月1日
 * <p>
 * 
 * @author burnszp(357252539@qq.com)
 * 
 * 
 */
@Table("fr_group_user")
public class GroupUser {
	@Id
	private Long id;
	@Column("fr_group_id")
	private Long groupId;
	@Column("fr_user_id")
	private Long userId;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
}
