<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

    $(function(){

    });
</script>

    <div class="col-sm-8 text-left">
        <div class ="row content">
            <div class="col-sm-6" >


            <div class="container">

                <h2>Detail Page.</h2>
                <form id="update_form" >
                    <div class="form-group">
                        <label for="id">Email:</label>
                        <input type="text" class="form-control" id="id"  name="email" value="${gcust.id}" readonly>
                    </div>

                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input type="password" class="form-control" id="pwd" name="pwd" value="${gcust.pwd}" readonly>
                    </div>

                    <div class="form-group">
                        <label for="name">name:</label>
                        <input type="name" class="form-control" id="name" value="${gcust.name}"  name="name" readonly>
                    </div>

                    <div class="checkbox">
                        <label><input type="checkbox" name="remember"> Remember me</label>
                    </div>


                    <button id="update_btn" type="button" class="btn btn-default">Update</button>

                    <button id="delete_btn" type="button" class="btn btn-default">Delete</button>
                </form>
            </div>

            </div>
    </div>
    </div>