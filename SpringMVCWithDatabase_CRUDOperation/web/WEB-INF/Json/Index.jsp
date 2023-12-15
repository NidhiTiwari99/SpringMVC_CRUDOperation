
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value='/resources/css/bootstrap.min.css'></c:url>" rel="stylesheet">
        <script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
        <script src="<c:url value='/resources/js/bootstrap.min.js'></c:url>"></script>
        <script>
            $(document).ready(function(){
                FetchStudents();
                $("#btnaddstudent").click(function(){
                    $("#studentmodal").modal("show")
                })
                $("#btnclose").click(function(){
                    ClearData();
                })
                $("#btnsubmit").click(function(){
                    AddStudent();
                })
                $("#btnupdate").click(function(){
                   UpdateStudent();
                })

            })
            function FetchStudents(){
                $.ajax({
                    url:'http://localhost:8089/SpringMVCWithModelForm/studentlist',
                    method:'get',
                    contentType:'application/json',
                    success:function(resp){
//                        console.log(resp);
                    $("#tbldata").empty();
                    $.each(resp,function(i,d){
                        $("#tbldata").append("<tr><td>"+d.rno+"</td><td>"+d.name+"</td><td>"+d.english+"</td><td>"+d.maths+"</td><td>"+d.science+"</td><td><button onclick='ViewStudent("+d.rno+")'><span class='glyphicon glyphicon-edit'> </span></button> &nbsp;<button onclick='DeleteStudent("+d.rno+")'><span class='glyphicon glyphicon-remove'> </span></button></td></tr>")
                    })
                    }
                })
            }
            
            function AddStudent(){
                var r=$("#txtrno").val();
                var n=$("#txtname").val();
                var e=$("#txtenglish").val();
                var m=$("#txtmaths").val();
                var s=$("#txtscience").val();
                var st={"rno":r,"name":n,"english":e,"maths":m,"science":s};
                console.log(st)
                $.ajax({
                    url:'/SpringMVCWithModelForm/addstudent',
                    method:'post',
                    data:JSON.stringify(st),
                    contentType: 'application/json',
                    success:function(resp){
                        alert("Student Added Successfully");
                        ClearData();
                        FetchStudents();
                    }
                })
            }
            
            function ViewStudent(rno){
           $.ajax({
                    url:'http://localhost:8089/SpringMVCWithModelForm/getstudent/'+rno,
                    method:'get',
                    contentType:'application/json',
                    success:function(resp){
                        console.log(resp);

                        $("#txtrno").val(resp.rno);
                        $("#txtname").val(resp.name);
                        $("#txtenglish").val(resp.english);
                        $("#txtmaths").val(resp.maths);
                        $("#txtscience").val(resp.science);
                        $("#studentmodal").modal("show");


                        }
                })
           
           
            }
            function UpdateStudent(){
                var r=$("#txtrno").val();
                var n=$("#txtname").val();
                var e=$("#txtenglish").val();
                var m=$("#txtmaths").val();
                var s=$("#txtscience").val();
                var st={"rno":r,"name":n,"english":e,"maths":m,"science":s};
                console.log(st)
                $.ajax({
                    url:'/SpringMVCWithModelForm/updatestudent',
                    method:'post',
                    data:JSON.stringify(st),
                    contentType: 'application/json',
                    success:function(resp){
                        alert("Student Updated Successfully");
                        ClearData();
                        FetchStudents();
                    }
                })
            }
            
            function DeleteStudent(rno){
                if(confirm("Really wants to Delete?"))
                {
                    $.ajax({
                    url:'http://localhost:8089/SpringMVCWithModelForm/deletestudent/'+rno,
                    method:'post',
                    contentType:'application/json',
                    success:function(resp){

                        alert("Student Deleted Successfully");
                        FetchStudents();
                        }
                })
           
                }
           
            }

    
    function  ClearData(){
                $("#txtrno").val("");
                $("#txtname").val("");
                $("#txtenglish").val("");
                $("#txtmaths").val("");
                $("#txtscience").val("");
                $("#studentmodal").modal("hide");
    }
        </script>
    </head>
    <body>
        <div class="container">
            <input type="button" value="Add Student" id="btnaddstudent" class="btn btn-primary">

            <div class="modal fade" id="studentmodal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>Student form</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Roll No</label>
                                <input type="text" id="txtrno" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label>Student Name</label>
                                <input type="text" id="txtname" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label>English</label>
                                <input type="text" id="txtenglish" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label>Maths</label>
                                <input type="text" id="txtmaths" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label>Science</label>
                                <input type="text" id="txtscience" class="form-control"/>
                            </div>

                        </div>
                        <div class="modal-footer">
                      <input type="button" value="Submit" id="btnsubmit" class="btn btn-primary"/>
                       <input type="button" value="Update" id="btnupdate" class="btn btn-info"/>
                        <input type="button" value="Close" id="btnclose" class="btn btn-danger"/>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <hr/>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Roll No</th>
                        <th>Student Name</th>
                        <th>English</th>
                        <th>Maths</th>
                        <th>Science</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="tbldata"></tbody>
            </table>
        </div>
    </body>
</html>
