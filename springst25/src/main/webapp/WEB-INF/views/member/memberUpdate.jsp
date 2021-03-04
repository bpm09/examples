<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>

	body {
		align:center
	}
	
	table {
		border : 2px lightgray solid;
		width : 510px;
		height : 400px;
	}

	#span {
		width:130px;
		text-align:center;
	}
	
	#span1 {
		width:300px;
	}
	
	select {
		width : 50px;
		height : 30px;
	}

	input {
		width:250px;
		height:30px;
	}

</style>

<script>
	$(function() {
		
		var pwdChecking = false;
		var pwd2Checking = false;
		var nameChecking = true;
		var emailChecking = true; 
		var ageChecking = true;
		var phoneChecking = true;
		var addressChecking = true;
		
		// 빈칸확인 및 정규식
		$(function(){
			
		
		// 비밀번호
		$('#passwd').keyup(function(){
			var passwd = $('#passwd').val();
			var passwdInput = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/);
			if(passwdInput.test(passwd) == false){
				$('#passwdInput').text('8~16자 문자, 숫자, 특수문자를 사용하세요.').css('color', 'red').show();
				passwdChecking = false;
				console.log(passwdChecking);
			} else {
				console.log('passwdChecking');
				$('#passwdInput').hide();
				passwdChecking = true;
				console.log(passwdChecking)
			}
		});
		
		// 비밀번호 확인
		$('#passwd2').keyup(function(){
			var passwd = $('#passwd').val();
			var passwd2 = $('#passwd2').val();
			
			if(passwd != passwd2 || passwd2 == "") {
				$('#passwd2Input').text('비밀번호가 일치하지 않습니다.').css('color', 'red').show();
				passwd2Checking = false;
				console.log(passwd2Checking);
			} else {
				$('#passwd2Input').text('비밀번호가 일치합니다.').css('color', 'green').show();
				passwd2Checking = true;
				console.log(passwd2Checking);
			}
		});		
		
		// 이름 확인
		$('#name').keyup(function(){
			var name = $('#name').val();
			var nameInput = RegExp(/^[가-힣]{2,6}$/);
			if(nameInput.test(name) == false) {
				$('#nameInput').text('2~6자 한글만 입력해주세요.').css('color', 'red').show();
				nameChecking = false;
				console.log(nameChecking);
			} else {
				$('#nameInput').hide();
				nameChecking = true;
				console.log(nameChecking);
			}
		});
		
		// 이메일 확인
		$('#email').keyup(function(){
			var email = $('#email').val();
			var emailInput = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			if(emailInput.test(email) == false) {
				$('#emailInput').text('이메일 형식을 확인해주세요.').css('color','red').show();
				emailChecking = false;
				console.log(emailChecking);
			} else {
				$('#emailInput').hide();
				emailChecking = true;
				console.log(emailChecking);
			}
		});
		
		// 나이 확인(숫자만)
		$('#age').keyup(function(){
			var age = $('#age').val();
			var ageInput = RegExp(/^[0-9]{1,3}$/);
			if(ageInput.test(age) == false) {
				$('#ageInput').text('나이를 정확히 입력해주세요.(숫자만)').css('color', 'red').show();
				ageChecking = false;
				console.log(ageChecking);
			} else {
				$('#ageInput').hide();
				ageChecking = true;
				console.log(ageChecking);
			}
		});
		
		// 휴대폰
		$('#phone').keyup(function(){
			var phone = $('#phone').val();
			var phoneInput = RegExp(/^01[0179][0-9]{7,8}$/);
			if(phoneInput.test(phone) == false) {
				$('#phoneInput').text('번호를 정확히 입력해주세요.').css('color', 'red').show();
				phoneChecking = false;
				console.log(phoneChecking);
			} else {
				$('#phoneInput').hide();
				phoneChecking = true;
				console.log(phoneChecking);
			}
		});
		
		// 주소(공백만 확인)
		$('#address').keyup(function(){
			var address = $('#address').val();
			if(address == null) {
				$('#addressInput').text('주소를 기입해주세요.').css('color', 'red').show();
				addressChecking = false;
				console.log(addressChecking);
			} else {
				$('#addressInput').hide();
				addressChecking = true;
				console.log(addressChecking);
			}
		})
		
		});
		
		
		
		$('#update').click(function() {
			// var queryString = $('#frm').serialize();
			var id = $('#id').val();
			var passwd = $('#passwd').val();
			var passwd2 = $('#passwd2').val();
			var name = $('#name').val();
			var email = $('#email').val();
			var gender = $('#gender').val();
			var age = $('#age').val();
			var phone = $('#phone').val();
			var address = $('#address').val();
			
			if (passwdChecking == true && passwd2Checking == true && nameChecking == true && emailChecking == true && ageChecking == true
						&& phoneChecking == true && addressChecking == true) {
				$.ajax({
					type : "post",
					url : "memberUpdate.do",
					data : {
						"id" : id,
						"passwd" : passwd,
						"name" : name,
						"email" : email,
						"gender" : gender,
						"age" : age,
						"phone" : phone,
						"address" : address
					},
					success : function(data) {
						console.log("hi")
						if (data == 1) {
							alert("수정되었습니다.")
							window.location.href = "memberList.do";
						} else {
							alert("수정실패. 관리자에 문의하세요")
						}
					},
					error : function(request, status, error) {
						location.href = "www.naver.com"
					}
				}) // ajax 끝
			} else {
				alert("모든 항목을 정확히 기입하시기 바랍니다.")
			}
		}) // submit 끝
		
		
	})
</script>

</head>
<body>

<table>
	<tr>
		<td id="span">
			<span class="span"> 아이디  </span>
		</td>
		<td id="span1">
			<input type="text" id="id" name="id" value=${member.id } readonly style="background:lightgray">
		</td>
	</tr>
	
	<tr>
		<td id="span">
			<span class="span"> 비밀번호  </span>
		</td>
		<td id="span1">
			<input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요">
			<span id="passwdInput"></span>
		</td>
	</tr>
	
	<tr>
		<td id="span">
			<span class="span"> 비밀번호 확인  </span>
		</td>
		<td id="span1">
			<input type="password" id="passwd2" name="passwd" placeholder="비밀번호를 입력해주세요">
			<span id="passwd2Input"></span>
		</td>
	</tr>
	
	<tr>
		<td id="span">
			<span class="span"> 이름  </span>
		</td>
		<td id="span1">
			<input type="text" id="name" name="name" placeholder="이름을 입력해주세요" value=${member.name }>
			<span id="nameInput"></span>
		</td>
	</tr>
	
	<tr>
		<td id="span">
			<span class="span"> 이메일 </span>
		</td>
		<td id="span1">
			<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요" value=${member.email }>
			<span id="emailInput"></span>
		</td>
	</tr>
	
	<tr>
		<td id="span">
			<span class="span"> 성별  </span>
		</td>
		<td id="span1">
			<select id="gender" name="gender">
			<option value="M" ${member.gender=="M"?"selected":""}>남</option>
			<option value="F" ${member.gender=="F"?"selected":""}>여</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td id="span">
			<span class="span"> 나이  </span>
		</td>
		<td id="span1">
			<input type="text" id="age" name="age" placeholder="나이를 입력해주세요(숫자만)" value=${member.age }>
			<span id="ageInput"></span>
		</td>
	</tr>
	
	<tr>
		<td id="span">
			<span class="span"> 휴대폰  </span>
		</td>
		<td id="span1">
			<input type="text" id="phone" name="phone" placeholder="휴대폰 번호를 입력해주세요 (-)제외" value=${member.phone }>
			<span id="phoneInput"></span>
		</td>
	</tr>
	
	<tr>
		<td id="span">
			<span class="span"> 주소  </span>
		</td>
		<td id="span1">
			<input type="text" id="address" name="address" placeholder="주소를 입력해주세요" value=${member.address }>
			<span id="addressInput"></span>
		</td>
	</tr>
</table>

<br>
<div>
	<input type="button" id="update" value="수정하기"> 
	<input type="button" value="취소" onclick="history.back()"> 
</div>

</body>
</html>