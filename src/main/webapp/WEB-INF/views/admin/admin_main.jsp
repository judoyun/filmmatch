<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory Management</title>

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${ pageContext.request.contextPath }/css/admin/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="../css/main/main.css">


</head>
<body class=""> <!-- class="sb-nav-fixed" -->
    <!-- header -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>
   <!-- menu -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/admin_menu.jsp"/>
    
    <main>
        <div class="container-fluid px-4" >
            <h1 class="mt-4" style="text-align:center">관리자 페이지</h1>
 
            <div class="row">
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-primary text-white mb-4">
                        <div class="card-body">재고관리</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" 
                                href="admin_inventory.do">View Details</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-warning text-white mb-4">
                        <div class="card-body">상품관리</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="goods_list_admin.do">View Details</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-success text-white mb-4">
                        <div class="card-body">회원관리</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="admin_member.do">View Details</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-danger text-white mb-4">
                        <div class="card-body">고객센터</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="${pageContext.request.contextPath}/support/home.do">View Details</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-area me-1"></i>
                            공지사항
                        </div>
                        <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas>
                          <table>
                        <thead>
                            <tr>
                           <th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
                          
                            </tr>
                        </thead>
                    
                        <tbody>
                 	<c:forEach var="vo" items="${noticeList}" varStatus="i">
									
								  <tr>
								  <!-- 번호 -->
								  <td>
									${i.index}
								  </td> 
								  
								  <td>
								  
								  <!-- 제목 -->
								  <c:if test="${ vo.n_use eq 'y' }">
										<a href="${pageContext.request.contextPath}/support/notice_view.do?n_idx=${ vo.n_idx }&page=${ empty param.page ? 1 : param.page }">${ vo.n_subject }</a>
								  </c:if>

								   </td>
								  
								  <!-- 작성자 -->
								  <td class="mem_name">
									  ${vo.mem_name}
								  </td>
								  
								  <!-- 작성일 -->
									<td class="n_regdate">
										${ fn:substring(vo.n_regdate,0,10)}
									</td>
								  
								  <!-- 조회수 -->
								  <td class="n_readhit">
									  ${vo.n_readhit}
								  </td>
							  </tr>
								</c:forEach>
                        </tbody>
                    </table>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-bar me-1"></i>
                            자주찾는질문
                        </div>
                        <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas>

                    <table>
                        <thead>
                            <tr>
                           <th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
                          
                            </tr>
                        </thead>
                    
                        <tbody>
                 	<c:forEach var="vo" items="${faqList}" varStatus="i">
									
									<tr>
										<!-- 번호 -->
										<td>
										  ${i.index}
										</td>                                             
										
										<td>
										<!-- 제목 -->
										<c:if test="${ vo.f_use eq 'y' }">
												<a href="${pageContext.request.contextPath}/support/faq_view.do?f_idx=${ vo.f_idx }&page=${ empty param.page ? 1 : param.page }">${ vo.f_subject }</a>
										</c:if>
										</td>
										
										<!-- 작성자 -->
										<td style="width:100px">
											${vo.mem_name}
										</td>
										
										<!-- 작성일 -->
										<td>
											${vo.f_regdate}
										</td>
										
										
										
										<!-- 조회수 -->
										<td >
											${vo.f_readhit}
										</td>
									</tr>
								</c:forEach>
                        </tbody>
                    </table>


                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    1:1문의사항
                </div>
                <div class="card-body">


                 
<table id="datatablesSimple">
                        <thead>
                            <tr>
                               	<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
                          
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                             	<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
                              
                            </tr>
                        </tfoot>
                        <tbody>
                 	<c:forEach var="vo" items="${supportList}" varStatus="i">
								
								<tr>
									<!-- 번호 -->
									<td>
										${i.index}
									</td>                                             
									
									<!-- 제목 -->
									<td>
										<!-- 메인글이 아니면 ㄴ 붙여라 -->
										<c:if test="${ vo.b_step ne 0 }">ㄴ</c:if><!-- ne = not 이퀄 -->
						
										<!-- 사용중 -- 상세페이지로 -->                              
										<c:if test="${ vo.b_use eq 'y' }">
										<a href="${pageContext.request.contextPath}/support/qna_view.do?b_idx=${ vo.b_idx }&page=${ empty param.page ? 1 : param.page }">${ vo.b_subject }</a>
										</c:if>
										</td>
									
									<!-- 작성자 -->
									<td class="mem_name">
										${vo.mem_name}
									</td>
									
									<!-- 작성일 -->
									<td class="b_regdate">
										${ fn:substring(vo.b_regdate,0,10)}
									</td>
									
									
									
									
									<!-- 조회수 -->
									<td class="b_readhit">
										${vo.b_readhit}
									</td>
									
								</tr>
							</c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </main>
    
    
    
    <!-- footer -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/admin_footer.jsp"/>
</biv>
   
    



</body>
</html>