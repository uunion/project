<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
 <!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

			<!-- 메뉴바 -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="/index"><i class="fa fa-dashboard fa-fw"></i>메인</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>게시판<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/notice/list">공지사항</a>
                                </li>
                                <li>
                                    <a href="/Qboard/listPageMap">질문게시판</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="/search"><i class="fa fa-table fa-fw"></i>검색</a>
                        </li>
                        
                         <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i>예약<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/reservation/register">예약</a>
                                </li>
                                <li>
                                    <a href="/reservation/reservationListAll">예약리스트</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        
                       
                        <li>
                            <a href="/reservation/map"><i class="fa fa-wrench fa-fw"></i>지도<span class="fa arrow"></span></a>
                            
                            <!-- /.nav-second-level -->
                        </li>
                        
                        
                        
                          <c:if test="${login.admin == 1 }">
                          <li>
                            <a href="/admin/memberList"><i class="fa fa-edit fa-fw"></i> 관리자메뉴</a>
                        </li>
                          </c:if>
                        
               
                       
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

<!-- /메뉴바 -->

</body>
</html>