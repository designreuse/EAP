<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <li class="header">模式与特色实验动物平台</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="new"><i class="fa fa-home"></i> <span>首页 HOME</span></a></li>
       	<li class="treeview">
          <a href="#"><i class="fa fa-file-text"></i> <span>动态公告</span> <i class="fa fa-angle-left pull-right"></i></a>
          <ul class="treeview-menu">
            <li><a href="announcement_list"><i class="fa fa-calendar-o"></i> 公告通知</a></li>
            <li><a href="experiment_list"><i class="fa fa- fa-eyedropper"></i> 特色实验</a></li>
            <li><a href="achievement_list"><i class="fa fa-trophy"></i> 科研成果</a></li>
            <li><a href="law_list"><i class="fa fa-balance-scale"></i> 法律法规</a></li>
          </ul>
        </li>       
        <li class="treeview">
          <a href="#"><i class="fa fa-database"></i> <span>平台资源</span> <i class="fa fa-angle-left pull-right"></i></a>
          <ul class="treeview-menu">
            <li><a href="animal_resource"><i class="fa fa-paw"></i> 动物资源</a></li>
            <li><a href="equipment_resource"><i class="fa fa-flask"></i> 设备资源</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#"><i class="fa fa-phone"></i> <span> 平台服务</span> <i class="fa fa-angle-left pull-right"></i></a>
          <ul class="treeview-menu">
            <li><a href="technology_list"><i class="fa fa-thumbs-up"></i> 技术服务</a></li>
            <li><a href="training_list"><i class="fa fa-mortar-board"></i> 教育培训</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#"><i class="fa fa-commenting"></i> <span>其他信息</span> <i class="fa fa-angle-left pull-right"></i></a>
          <ul class="treeview-menu">
            <li><a href="abstract_text"><i class="fa fa-book"></i> 平台介绍</a></li>
            <li><a href="about_us"><i class="fa fa-group"></i> 关于我们</a></li>
          </ul>
        </li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>