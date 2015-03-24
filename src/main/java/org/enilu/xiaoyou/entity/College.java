package org.enilu.xiaoyou.entity;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * 学校实体
 * <p>
 * 2014年9月29日
 * <p>
 * 
 * @author enilu(82552623@qq.com)
 * 
 * 
 */
@Table("fr_college")
public class College {
	@Id
	private Long id;
	@Column
	private String cname;
	@Column("addr_code")
	private Long addrCode;
	@Column("addr")
	private String addr;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Long getAddrCode() {
		return addrCode;
	}

	public void setAddrCode(Long addrCode) {
		this.addrCode = addrCode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

}
