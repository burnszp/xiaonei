/**
 *MsgBox.java
 *Version1.0
 *2015-3-31
 *Copyright cnendata.com
 *
 */
package org.enilu.xiaoyou.entity;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * 消息<br>
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
@Table("fr_msgbox")
public class MsgBox {
	/**
	 * 已经读过标识
	 */
	public static final int HAS_READED = 1;
	/**
	 * 没有读过标识
	 */
	public static final int NO_READ = 0;
	@Id
	private Long id;
	@Column("send_user")
	private String sendUser;
	@Column("send_date")
	private Date sendDate;
	@Column("receive_user")
	private Long receiveUser;
	@Column("if_read")
	private int ifRead;
	@Column()
	private String descript;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSendUser() {
		return sendUser;
	}

	public void setSendUser(String sendUser) {
		this.sendUser = sendUser;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public Long getReceiveUser() {
		return receiveUser;
	}

	public void setReceiveUser(Long receiveUser) {
		this.receiveUser = receiveUser;
	}

	public int getIfRead() {
		return ifRead;
	}

	public void setIfRead(int ifRead) {
		this.ifRead = ifRead;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

}
