<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">


<meta charset="utf-8">


	<h3 ><i class="fa fa-th-large"></i>발주 신청 내역</h3>
 
   <div class="col-lg-10">
      <br> 전체 글 : ${count}
   </div>
   <div class="col-lg-10" style="margin-bottom: 25px;">

      <table class="table table-striped">

         <thead>
            <tr>
               <th style="text-align: center;">No.</th>
               <th style="text-align: center;">발주번호</th>
               <th style="text-align: center;">제목</th>
               <th style="text-align: center;">발주상태</th>
            </tr>
         </thead>
         <c:forEach var="orderslist" items="${list}">
            <c:if test="${number > 0 }">
               <tr>
                  <td align="center"><c:out value="${number}" /> <c:set
                        var="number" value="${number-1 }" /></td>
                 	<td align="center">${orderslist.o_no}</td>
                  <td align="center"><a
                     href="orders_content.do?o_no=${orderslist.o_no}&pageNum=${pageNum}"><fmt:formatDate
                           value="${orderslist.o_date}" type="date" dateStyle="long" />
                        발주 신청 내역 </a></td>
                  <td align="center">${orderslist.o_state}</td>
               </tr>
            </c:if>
         </c:forEach>

      </table>
   </div>
   <div style="clear: both;"></div>
   <div align="center" class="col-lg-10" style="margin-bottom: 25px;">
      <c:if test="${count > 0}">
         <c:set var="pageCount"
            value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
         <c:set var="pageBlock" value="${10}" />
         <fmt:parseNumber var="result" value="${currentPage / 10}"
            integerOnly="true" />
         <c:set var="startPage" value="${result * 10 + 1}" />
         <c:set var="endPage" value="${startPage + pageBlock-1}" />
         <c:if test="${endPage > pageCount}">
            <c:set var="endPage" value="${pageCount}" />
         </c:if>

         <c:if test="${startPage > 10}">
            <a href="orders_list.do?pageNum=${startPage-10}">[이전]</a>
         </c:if>

         <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <a href="orders_list.do?pageNum=${i}">[${i}]</a>
         </c:forEach>

         <c:if test="${endPage < pageCount}">
            <a href="orders_list.do?pageNum=${startPage + 10}">[다음]</a>
         </c:if>
      </c:if>
   </div>
   <!-- /.container-fluid-->
   <!-- /.content-wrapper-->
   <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top"> <i
      class="fa fa-angle-up"></i>
   </a>
   <!-- Logout Modal-->
   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
               <button class="close" type="button" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">×</span>
               </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready
               to end your current session.</div>
            <div class="modal-footer">
               <button class="btn btn-secondary" type="button"
                  data-dismiss="modal">Cancel</button>
               <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
         </div>
      </div>
   </div>
   <!-- Bootstrap core JavaScript-->
   <script src="/d_time/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
   <script src="/d_time/resources/bootstrap/vendor/popper/popper.min.js"></script>
   <script
      src="/d_time/resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
   <!-- Core plugin JavaScript-->
   <script
      src="/d_time/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
   <!-- Page level plugin JavaScript-->
   <script src="/d_time/resources/bootstrap/vendor/chart.js/Chart.min.js"></script>
   <script
      src="/d_time/resources/bootstrap/vendor/datatables/jquery.dataTables.js"></script>
   <script
      src="/d_time/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.js"></script>
   <!-- Custom scripts for all pages-->
   <script src="/d_time/resources/bootstrap/js/sb-admin.min.js"></script>
   <!-- Custom scripts for this page-->
   <script src="/d_time/resources/bootstrap/js/sb-admin-datatables.min.js"></script>
   <script src="/d_time/resources/bootstrap/js/sb-admin-charts.min.js"></script>
   </div>


</html>
