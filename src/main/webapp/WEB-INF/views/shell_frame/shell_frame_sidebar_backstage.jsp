﻿<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--
这是主框架.
-->
    <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar Menu -->
      <ul class="sidebar-menu">
        <li class="header">模式与特色实验动物平台【后台管理】</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active">
        	<c:if test="${admin.authority eq 'SUPER'}">
        		<a href="super/index"><i class="fa fa-home"></i> <span>个人中心</span></a>
	        </c:if>
        	<c:if test="${admin.authority eq 'ADMIN'}">
        		<a href="admin/index"><i class="fa fa-home"></i> <span>个人中心|后台主页</span></a>
	        </c:if>        
        </li>
       	<li class="treeview">
          <a href="#"><i class="fa fa-file-text"></i> <span>动态公告管理</span> <i class="fa fa-angle-left pull-right"></i></a>
          <ul class="treeview-menu">
            <li><a href="admin/announcement_list"><i class="fa fa-calendar-o"></i> 公告通知管理</a></li>
            <li><a href="admin/experiment_list"><i class="fa fa- fa-eyedropper"></i> 特色实验管理</a></li>
            <li><a href="admin/achievement_list"><i class="fa fa-trophy"></i> 科研成果管理</a></li>
            <li><a href="admin/law_list"><i class="fa fa-balance-scale"></i> 法律法规管理</a></li>
          </ul>
        </li>       
        <li class="treeview">
          <a href="#"><i class="fa fa-database"></i> <span>平台资源管理</span> <i class="fa fa-angle-left pull-right"></i></a>
          <ul class="treeview-menu">
            <li><a href="admin/animal_resource"><i class="fa fa-paw"></i> 动物资源管理</a></li>
            <li><a href="admin/equipment_resource"><i class="fa fa-flask"></i> 设备资源管理</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#"><i class="fa fa-phone"></i> <span> 平台服务管理</span> <i class="fa fa-angle-left pull-right"></i></a>
          <ul class="treeview-menu">
            <li><a href="admin/technology_list"><i class="fa fa-thumbs-up"></i> 技术服务管理</a></li>
            <li><a href="admin/training_list"><i class="fa fa-mortar-board"></i> 教育培训管理</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#"><i class="fa fa-commenting"></i> <span>其他信息管理</span> <i class="fa fa-angle-left pull-right"></i></a>
          <ul class="treeview-menu">
            <li><a href="admin/user_list"><i class="fa fa-user"></i> 用户管理</a></li>
            <li><a href="admin/role_list"><i class="fa fa-user-secret"></i> 管理员角色管理</a></li>
            <li><a href="admin/power_list"><i class="fa fa-user-secret"></i> 管理员权限管理</a></li>
            <li><a href="admin/file_list"><i class="fa fa-folder-open"></i> 文件管理</a></li>
            <li><a href="admin/message_list"><i class="fa fa-envelope-o"></i> 通知管理</a></li>
            <li><a href="admin/organization_list"><i class="fa fa-bank"></i> 单位管理</a></li>
            <li><a href="admin/person_list"><i class="fa fa-group"></i> 联系人管理</a></li>
          </ul>
        </li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>