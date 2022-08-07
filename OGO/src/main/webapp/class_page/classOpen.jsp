<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>클래스 등록</title>
    <style type="text/css">
    	.one{
    		margin-top: 100px;
    		margin-left: 300px;
    		margin-right: 300px;
    		margin-bottom: 200px;
    	}
    	two{
    		text-align: center;
    	}
    </style>
  </head>
  <body>
  <div class="one">
  	<div id="two">
  		<h1>클래스 등록</h1>
  	</div>
  	<br>
    <form class="row g-3" id="classOpenForm">
	  <div class="col-md-12">
	    <label for="inputclassName" class="form-label">클래스명</label>
	    <input type="text" class="form-control" id="classOpenName" placeholder="클래스명">
	  </div>
	  <div class="col-md-6">
	    <label for="inputState" class="form-label">클래스 종류</label>
	    <select id="selectCategory" class="form-select">
	      <option selected>Category</option>
	      <option class="category" value="뷰티">뷰티</option>
	      <option class="category" value="외국어">외국어</option>
	      <option class="category" value="댄스·뮤직">댄스·뮤직</option>
	      <option class="category" value="요리·공예">요리·공예</option>
	      <option class="category" value="드로잉·디자인·영상">드로잉·디자인·영상</option>
	    </select>
	  </div>
	  <div class="col-md-6">
	    <label for="inputState" class="form-label">클래스 종류</label>
	    <select id="inputState" class="form-select">
	      <option selected>Sub Category</option>
	      
	      <option class="subCategory" value="메이크업">메이크업</option>
	      <option class="subCategory" value="스타일링">스타일링</option>
	      <option class="subCategory" value="영어">영어</option>
	      <option class="subCategory" value="일본어·중국어">일본어·중국어</option>
	      <option class="subCategory" value="기타외국어">기타 외국어</option>
	      <option class="subCategory" value="댄스">댄스</option>
	      <option class="subCategory" value="뮤직">뮤직</option>
	      <option class="subCategory" value="요리·음료">요리·음료</option>
	      <option class="subCategory" value="공예·DIY">공예·DIY</option>
	      <option class="subCategory" value="디자인">디자인</option>
	      <option class="subCategory" value="영상">영상</option>
	    </select>
	  </div>
	  <div class="col-12">
	    <label for="inputDate" class="form-label">클래스 일자</label>
	    <input type="text" class="form-control" id="inputDate" placeholder="클래스 일자">
	  </div>
	  <div class="col-11">
	    <label for="inputPrice" class="form-label">클래스 가격</label>
	    <input type="text" class="form-control" id="inputPrice" placeholder="클래스 가격">
	  </div>
	  <div class="col-1">
	  	<br><br>
	  	<p>(원)</p>
	  </div>
	  <div class="col-12">
	    <label for="inputPlace" class="form-label">클래스 위치</label>
	    <input type="text" class="form-control" id="inputPlace" placeholder="클래스 위치">
	  </div>
	  <div class="col-12">
	    <label for="classPhotoUpload" class="form-label">클래스 소개 사진 업로드</label>
	    <input type="text" class="form-control" id="classPhotoUpload" placeholder="클래스 사진">
	  </div>
	  <div class="mb-3">
	  	<label for="textClassInfo" class="form-label">클래스 소개</label>
	  	<textarea class="form-control" id="textClassInfo" rows="5"></textarea>
	  </div>
	  <div class="mb-3">
	  	<label for="textTutorInfo" class="form-label">튜터 소개</label>
	  	<textarea class="form-control" id="textTutorInfo" rows="5"></textarea>
	  </div>
	  <div class="mb-3">
	  	<label for="textNotice" class="form-label">클래스 공지사항</label>
	  	<textarea class="form-control" id="textNotice" rows="5"></textarea>
	  </div>
	  <div class="mb-3">
	  	<label for="textAttention" class="form-label">클래스 유의사항</label>
	  	<textarea class="form-control" id="textAttention" rows="5"></textarea>
	  </div>
	  <div class="col-12">
	    <div class="form-check">
	      <input class="form-check-input" type="checkbox" id="gridCheck">
	      <label class="form-check-label" for="gridCheck">
	        Check me out
	      </label>
	    </div>
	  </div>
	  <div class="col-12">
	    <button type="submit" class="btn btn-primary">등록하기</button>
	  </div>
	</form>
   
   </div>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>