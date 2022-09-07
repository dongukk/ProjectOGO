<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
	$(document).ready(function() {
/* 클래스소개 일정 */	
		$('.classpage_tab1-1').click(function() {
			/* alert('정상작동'); */
			$(".classpage_tab1n").addClass('classpageTab_hidden');
			$(".classpage_tab1-1n").removeClass('classpageTab_hidden');
		})
		$('.classpage_tab1').click(function() {
			$(".classpage_tab1-1n").addClass('classpageTab_hidden');
			$(".classpage_tab1n").removeClass('classpageTab_hidden');
		})
		
/* 튜터소개 공지사항 유의사항 */		
		$('.classpage_tab2').click(function() {
			$(".classpage_tab2-1n").addClass('classpageTab_hidden');
			$(".classpage_tab2-2n").addClass('classpageTab_hidden');
			$(".classpage_tab2n").removeClass('classpageTab_hidden');
		})
		$('.classpage_tab2-1').click(function() {
			$(".classpage_tab2n").addClass('classpageTab_hidden');
			$(".classpage_tab2-2n").addClass('classpageTab_hidden');
			$(".classpage_tab2-1n").removeClass('classpageTab_hidden');
		})
		$('.classpage_tab2-2').click(function() {
			$(".classpage_tab2n").addClass('classpageTab_hidden');
			$(".classpage_tab2-1n").addClass('classpageTab_hidden');
			$(".classpage_tab2-2n").removeClass('classpageTab_hidden');
		})
		
		$(".tab_menu").css('cursor','pointer');
		$(".tab_menu").css('cursor','difault');
	})//end ajax

</script>