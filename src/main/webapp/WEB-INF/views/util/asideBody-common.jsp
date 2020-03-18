<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.nav-item.show .fa-circle {
	float: left;
	margin-top: 6px;
	margin-right: 10px;
	font-size: 5px;
}

.nav-item.show .fa-angle-right, .nav-item.show .fa-angle-down {
	float: right;
	margin-top: 4px;
}
</style>

<div class="aside-body">
	<div class="aside-loggedin">
		<div class="d-flex align-items-center justify-content-start">
			<a href="#" class="avatar">
				<img src="../../img/avatar.png" class="rounded-circle" alt="">
			</a>
			<div class="aside-alert-link">
				<a href="#" class="new" data-toggle="tooltip" title="You have 2 unread messages">
					<i data-feather="message-square"></i>
				</a>
				<a href="#" class="new" data-toggle="tooltip" title="You have 4 new notifications">
					<i data-feather="bell"></i>
				</a>
				<a href="#" data-toggle="tooltip" title="Sign out">
					<i data-feather="log-out"></i>
				</a>
			</div>
		</div>
		<div class="aside-loggedin-user">
			<a href="#loggedinMenu" class="d-flex align-items-center justify-content-between mg-b-2" data-toggle="collapse">
				<h6 class="tx-semibold mg-b-0">Unkonwn User</h6>
				<i data-feather="chevron-down"></i>
			</a>
			<p class="tx-color-03 tx-12 mg-b-0">Administrator</p>
		</div>
		<div class="collapse" id="loggedinMenu">
			<ul class="nav nav-aside mg-b-0">
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i data-feather="edit"></i>
						<span>Edit Profile</span>
					</a>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i data-feather="user"></i>
						<span>View Profile</span>
					</a>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i data-feather="settings"></i>
						<span>Account Settings</span>
					</a>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i data-feather="help-circle"></i>
						<span>Help Center</span>
					</a>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i data-feather="log-out"></i>
						<span>Sign Out</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- aside-loggedin -->
	<ul class="nav nav-aside navbar-common">
		<c:set var="moduleCount" value="0"></c:set>
		<c:set var="moduUnder" value="null"></c:set>
		<c:forEach items="${menu}" var="module">
			<c:set var="moduleCount" value="${moduleCount+1}"></c:set>
			<c:if test="${moduUnder=='null'}">
				<c:set var="moduUnder" value="${module.moduleUnder}"></c:set>
				<li class="nav-label">${module.moduleUnder}</li>
			</c:if>
			<c:if test="${moduUnder!=module.moduleUnder}">
				<c:set var="moduUnder" value="${module.moduleUnder}"></c:set>
				<li class="nav-label mg-t-25">${module.moduleUnder}</li>
			</c:if>
			<c:if test="${fn:length(module.subMenus) le 0}">
				<c:if test="${module.id==1}">
					<li class="moduleLi_${moduleCount} moduleLi nav-item ">
						<a href="javascript:;" class="m-link_0 nav-link default-link nav-link-new" onclick="loadPage(this,'${module.link}','m-link_0','moduleLi_${moduleCount}','${VorH}')">
							<%-- <i data-feather="${module.moduleIcon}"></i> --%>
							<span>${module.moduleName}</span>
						</a>
					</li>
				</c:if>
				<c:if test="${module.id>1}">
					<li class="moduleLi_${moduleCount} moduleLi nav-item ">
						<a href="javascript:;" class="m-link_0 nav-link nav-link-new" onclick="loadPage(this,'${module.link}','m-link_0','moduleLi_${moduleCount}','${VorH}')">
							<%-- <i data-feather="${module.moduleIcon}"></i> --%>
							<span>${module.moduleName}</span>
						</a>
					</li>
				</c:if>
			</c:if>
			<c:if test="${fn:length(module.subMenus) gt 0}">
				<li class="moduleLi_${moduleCount} moduleLi nav-item with-sub">
					<a href="javascript:;" class="nav-link ">
						<%-- <i data-feather="${module.moduleIcon}"></i> --%>
						<span>${module.moduleName}</span>
					</a>
					<ul style="padding-left: 18px;">
						<c:set var="m1Count" value="0"></c:set>
						<c:forEach items="${module.subMenus}" var="m1" varStatus="c1">
							<c:set var="m1Count" value="${m1Count+1}"></c:set>
							<c:if test="${fn:length(m1.subMenus) le 0}">
								<!-- menu started -->
								<li class="nav-item menuLi" style="display: flex;">
									<a href="javascript:;" class="m-link_${m1Count} nav-link-new" data-linkcount="${m1Count}" onclick="loadPage(this,'${m1.link}','m-link_${m1Count}','moduleLi_${moduleCount}','${VorH}')">
										<i class="fa fa-minus" style="margin-top: 6px; margin-right: 10px; font-size: 13px;"></i>
										<span>${m1.menuName}</span>
									</a>
								</li>
							</c:if>
							<c:if test="${fn:length(m1.subMenus) gt 0}">
								<li class="nav-item menuLi">
									<a data-toggle="collapse" href="#menuCollapse${m1Count}" class="m-link_${m1Count} menuCollapse collapsed" data-linkcount="${m1Count}">
										<i class="fa fa-plus" style="font-size: 13px; margin-right: 10px;"></i>
										<span>${m1.menuName}</span>
										<i class="fa fa-angle-right" style=""></i>
									</a>
									<div id="menuCollapse${m1Count}" class="collapse">
										<ul class="" style="padding-left: 15px; padding-bottom: 0;">
											<c:set var="m2Count" value="0"></c:set>
											<c:forEach items="${m1.subMenus}" var="m2" varStatus="c1">
												<c:set var="m2Count" value="${m2Count+1}"></c:set>
												<c:if test="${fn:length(m2.subMenus) le 0}">
													<!-- menu started -->
													<li style="display: flex;">
														<a href="javascript:;" class="m-link_${m2Count} nav-link-new" data-linkcount="${m2Count}" onclick="loadPage(this,'${m2.link}','m-link_${m2Count}','moduleLi_${moduleCount}','${VorH}')">
															<i class="fa fa-minus" style="margin-top: 6px; margin-right: 7px; font-size: 13px;"></i>
															<span>${m2.menuName}</span>
														</a>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</c:if>
		</c:forEach>
	</ul>
</div>