package com.mgsoft.invoicing.beans;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table
public class Menu {
	@Id
	//@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	@Column
	private String  menuName;
	@Column
	private String  menuNameOl;
	@Column
	private String  link;     
	@Column
	private Long parentMenuId;
	@Column
	private Long moduleId;
	@Column
	private Integer menuCount;
	@Column
	private String  menuIcon; 
	@Column
	private String  addRight; 
	@Column
	private String  modRight; 
	@Column
	private String  delRight; 
	@Column
	private String  viewRight;
	@Column
	private String  printRight;  
	@Column
	private String  specialRight;
	@Column
	private boolean  hasLink;
	
	@Transient
	private List<Menu> subMenus = new ArrayList<>();
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuNameOl() {
		return menuNameOl;
	}
	public void setMenuNameOl(String menuNameOl) {
		this.menuNameOl = menuNameOl;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public Long getParentMenuId() {
		return parentMenuId;
	}
	public void setParentMenuId(Long parentMenuId) {
		this.parentMenuId = parentMenuId;
	}
	public Long getModuleId() {
		return moduleId;
	}
	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}
	public Integer getMenuCount() {
		return menuCount;
	}
	public void setMenuCount(Integer menuCount) {
		this.menuCount = menuCount;
	}
	public String getMenuIcon() {
		return menuIcon;
	}
	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}
	public String getAddRight() {
		return addRight;
	}
	public void setAddRight(String addRight) {
		this.addRight = addRight;
	}
	public String getModRight() {
		return modRight;
	}
	public void setModRight(String modRight) {
		this.modRight = modRight;
	}
	public String getDelRight() {
		return delRight;
	}
	public void setDelRight(String delRight) {
		this.delRight = delRight;
	}
	public String getViewRight() {
		return viewRight;
	}
	public void setViewRight(String viewRight) {
		this.viewRight = viewRight;
	}
	public String getPrintRight() {
		return printRight;
	}
	public void setPrintRight(String printRight) {
		this.printRight = printRight;
	}
	public String getSpecialRight() {
		return specialRight;
	}
	public void setSpecialRight(String specialRight) {
		this.specialRight = specialRight;
	}
	@Override
	public String toString() {
		return "Menu [id=" + id + ", menuName=" + menuName + ", menuNameOl=" + menuNameOl + ", link=" + link
				+ ", parentMenuId=" + parentMenuId + ", moduleId=" + moduleId + ", menuCount=" + menuCount
				+ ", menuIcon=" + menuIcon + ", addRight=" + addRight + ", modRight=" + modRight + ", delRight="
				+ delRight + ", viewRight=" + viewRight + ", printRight=" + printRight + ", specialRight="
				+ specialRight + "]";
	}

	public List<Menu> getSubMenus() {
		return subMenus;
	}
	public void setSubMenus(List<Menu> subMenus) {
		this.subMenus = subMenus;
	}
	public boolean isHasLink() {
		return hasLink;
	}
	public void setHasLink(boolean hasLink) {
		this.hasLink = hasLink;
	}
	
	
	
	
	
	
	
	
	
	
}
