<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src='//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/d3.min.js'></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<%@ include file="/common/bootStrap4.jsp"%>
<%@ include file="/common/styles.jsp"%>
<title>weather-test</title>
</head>
<body>
	<div style="text-align: -webkit-center; width: 100%; height: 240px; border-radius: 20px 20px 20px 20px/20px 20px 20px 20px; 
		 	 background-size: cover;">
		<table style="margin-top: 40px;">
			<tr>
				<td style="display: inline;">
					<table>
						<tr>
							<td style="width: 100%"><input id="where_c" type="text"
								style="border: none; width: 100%; text-align: center; background-color: transparent; font-weight: 900;">
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td style="text-align: center;"><img id="weather" alt="날씨"
								src="" style="width: 90px;"></td>
							<td><input id="Temperature" type="text"
								style="border: none; width: 130px; text-align: center; font-size: 48px; font-family: fantasy; background-color: transparent;">
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td style="text-align: center;">
							<img id="img_wind_hyang"
								alt="방향" style="width: 30px;"
								src="/erp/images/navigation_black.png">
							</td>
							<td style="text-align: center;">
							<img id="img_wind_power"
								alt="바람" style="width: 30px;" src="/erp/images/toys_black.png">
							</td>
							<td style="text-align: center;">
							<img id="img_cloud_info"
								alt="구름" style="width: 30px;" src="/erp/images/cloud_black.png">
							</td>
						</tr>
						<tr>
							<td><input id="wind_hyang" type="text"
								style="border: none; width: 80px; text-align: center; background-color: transparent;">
							</td>
							<td><input id="wind_power" type="text"
								style="border: none; width: 80px; text-align: center; background-color: transparent;">
							</td>
							<td><input id="cloud_info" type="text"
								style="border: none; width: 80px; text-align: center; background-color: transparent;">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>


</body>
</html>