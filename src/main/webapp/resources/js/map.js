//polyline을 생성하거나 제거할 때 구분하기 위한 변수(생성 : true, 제거 : false) 
var flag = false;

//클릭한 도시들의 마커를 담을 배열
var markerArray = [];
//클릭한 도시들의 마커들의 index 값을 담을 배열
var markerIndexArray = [];
//클릭한 도시들의 좌표값을 담을 배열
var pathArray = [];
//클릭한 도시들의 pathLine(폴리라인을 그을 좌표값)을 담을 배열
var lineArray = [];

var map;
var marker;
var markerIndex;
var addButton;

var lineRemoveIndex = 0;
var count = 0;

//map에서 가리킬 좌표를 담는 변수
var zoomLocation;
//map에서 가리킬 좌표의 zoom 값을 담는 변수
var zoomSize;

var markerIcon1 = "../../resources/images/planIcon/placeholder.png";
var markerIcon2 = "../../resources/images/planIcon/placeholder2.png";

var $stayDay;

//구글 지도 (현재위치 설정)
function initMap() {
	//처음 지도 위치
	var main = {lat: 36.337, lng: 127.402};
	map = new google.maps.Map(document.getElementById('map'), {
		zoom: 7,
		center: main
	});
	
	//cityInfoList의 length만큼 마커를 찍어준다.
	for (var i=0; i<cityInfoList.length; i++) {
		//console.log(i);
		marker = new google.maps.Marker({
			icon: markerIcon2,
			position: {lat: Number(cityInfoList[i].latitude), lng: Number(cityInfoList[i].langitude)},
		    				//위도와 경도를 Number 타입으로 바꾼다.
			map: map,
			title: cityInfoList[i].name,
			//zIndex: cityInfoList[i][3],
			index:i
		});
		marker.setVisible(false);
		markerArray.push(marker);
	}
	
	/* marker mouseover, mouseout function */
	markerMouseEvent();
	
	/* zoom_changed function */
	zoomEvent();

	/* infoWindow function */
	infoWindowEvent();
}

function infoWindowEvent() {
    var infoNameArray = [];
	var infoSummaryArray = [];
	var infoImageArray = [];
	var prevInfowindow = false;
	
	for(var i = 0; i < markerArray.length; i++) {
		//infoArray 배열에 차례대로 각 도시의 name, summary, image들을 담는다.
		infoNameArray.push(cityInfoList[i].name);
		infoSummaryArray.push(cityInfoList[i].summary);
		infoImageArray.push(cityInfoList[i].image);
		
		//makrerArray의 i번째를 클릭했을때 실행할 함수
		google.maps.event.addListener(markerArray[i], 'click', function() {
			markerIndex = this.index;
			//console.log(markerIndex);
			
			//시 마커를 클릭했을때 보여줄 내용을 담은 함수
			var infowindow = new google.maps.InfoWindow({
				content: "<img id='mainPlanCityInfoImage' src=" + infoImageArray[markerIndex] + "/>" +
						 "<span id='mainPlanCityInfo'>" + infoSummaryArray[markerIndex] + "</span>" +
						 "<div id='mainPlanAddButton'>" +
						 	"<img id='addButton' src='../../resources/images/planIcon/addButton.png'/>" +
						 "</div>"
			});
			//console.log(this.index);
			map.setZoom(11);
			map.setCenter(markerArray[markerIndex].getPosition());
			
			//prevInfowindow 변수를 사용해서 이전의 infowindow를 닫는다.
			if(prevInfowindow) {
				prevInfowindow.close();
			}
		    //prevInfowindow 변수에 infowindow를 담는다.
			prevInfowindow = infowindow;
		    //시 마커를 클릭했을때 infowindow를 오픈하여 내용을 보여준다. 
			infowindow.open(map, markerArray[markerIndex]);
			
			google.maps.event.addListener(infowindow, 'domready', function() {
		    	document.getElementById('addButton').addEventListener('click', function(event) {
		    		var startDate = document.getElementById('startDate').value;
					//console.log('startDate : ' + startDate);
					if(startDate == '') {
						alert('출발일을 입력해주세요!');
					} else {
			    		console.log(markerIndex);
			    		markerArray[markerIndex].setIcon(markerIcon1);
			    		markerArray[markerIndex].setVisible(true);
			    		
			    		markerIndexArray.push(markerIndex);
			    		console.log('markerIndexArray 길이 : ' + markerIndexArray.length);
			    		$('#mainPlanUl').append("<li class='leftMenuLi'>" +
			    									"<span class='cityName'>" + infoNameArray[markerIndex] + "</span>" +
			    									"<img class='removeButton' id='mainPlanRemoveButton' src='../../resources/images/planIcon/removeButton.png'/>" +
			    									"<div class='cityChooseMenu'>" +
			    										"<img class='arrowLeft' src='../../resources/images/planIcon/arrowPointingToLeft.png'/>" +
			    										"<span class='stayCount'>1</span>일" +
			    										"<img class='arrowRight' src='../../resources/images/planIcon/arrowPointingToRight.png'/>" +
			    									"</div>" +
			    								"</li>");
			    		
			    		$stayDay = Number(document.getElementById('stayDay').value);
			    		$stayDay += 1;
			    		document.getElementById('stayDay').value = Number($stayDay);
			    		
			    		//클릭한 도시만 리스트로 받아와서 이동경로(line)를 추가해야한다!!
						var latitude = Number(cityInfoList[markerIndex].latitude);
						var langitude = Number(cityInfoList[markerIndex].langitude);
						//console.log(markerIndex + ' : ' + latitude + ', ' + langitude);
						
						//pathArray 배열에 클릭한 도시의 좌표를 누적시키기 위해 전역변수로 둔다.
						pathArray.push({lat: latitude, lng: langitude});
						console.log('pathArray 길이 : ' + pathArray.length);
			    		
						//도시를 2개 이상 선택했을때, 이동경로를 찍기 위한 함수를 호출한다.
						if(pathArray.length >= 2) {
							flag = true;
			    			lineFunction(pathArray, flag);
						}
						//prevInfowindow 변수를 사용해서 이전의 infowindow를 닫는다.
						if(prevInfowindow) {
							prevInfowindow.close();
						}
					    //prevInfowindow 변수에 infowindow를 담는다.
						prevInfowindow = infowindow;
					}
		    	});
			});
		});
	}
}

function zoomEvent() {
	//현재 zoom 을 가져온다.
	var zoom = map.getZoom();
	//console.log("current zoom : " + zoom);
	//광역시는 먼저 보여준다.
	for(var i=73; i<=79; i++) {
		markerArray[i].setVisible(true);
	}
	
	//광역시는 zoom 8 (city_no_74 ~ city_no_80)
	//그 외는 zoom 9 (city_no_01 ~ city_no_73)
	google.maps.event.addListener(map, 'zoom_changed', function() {
		//zoom이 몇인지 담는다.
		zoom = map.getZoom();
		console.log(zoom);
		
		//zoom이 10일때부터 다른 모든 시들도 보여준다.
		if(zoom >= 10) {
			for(var i=0; i<=72; i++) {
				markerArray[i].setVisible(true);
			}
		} else if(zoom <= 8) {	//zoom이 8됬을때 다시 광역시만 보여준다. 클릭한 도시는 지우지 않고 그대로 보여준다.
			console.log('클릭한 도시 개수 : ' + markerIndexArray.length);
			var markerIndexArraySort = [];
			markerIndexArraySort = markerIndexArray;
			markerIndexArraySort.sort();
			//console.log('클릭한 도시 번호 차례대로 : ' + markerIndexArraySort);
			
			for(var i=0; i<=72; i++) {
				markerArray[i].setVisible(false);
			}
			
			/*var zoomCount = 0;
			for(var j=0; j<markerIndexArraySort.length; j++) {
				for(var i=0; i<=72; i++) {
					if(i != markerIndexArraySort[j]) {
						console.log(j + ' <!=> ' + markerIndexArraySort[j]);
						markerArray[i].setVisible(false);
					} else if(i == markerIndexArraySort[j]) {
						zoomCount++;
						console.log(j + ' <==> ' + markerIndexArraySort[j]);
						markerArray[i].setVisible(true);
					}
				}
			}*/
		}
	});
}

function markerMouseEvent() {
	//클릭한 도시는 mouseover든 mouseout이든 동작하지 않도록 하기!!
	for(var h=0; h<markerArray.length; h++) {
		var mouseOverListener = google.maps.event.addListener(markerArray[h], 'mouseover', function() {
			var mouseoverIndex = this.index;
			//console.log(mouseoverIndex + ', 클릭한 도시 개수 : ' + markerIndexArray.length);
			
			//클릭한 도시가 없을때
			if(markerIndexArray.length == 0) {
				markerArray[mouseoverIndex].setIcon(markerIcon1);
			} else {	//클릭한 도시가 있을때
				for(var j=0; j<markerIndexArray.length; j++) {
					//만약 클릭한 도시의 번호와 마우스가 올려져있는 마커의 도시 번호가 같지 않다면
					//마커 이미지를 빨간색으로 보여준다.
					if(mouseoverIndex != markerIndexArray[j]) {
						//console.log('클릭한 도시 번호 : ' + markerIndexArray[j]);
						markerArray[mouseoverIndex].setIcon(markerIcon1);
						//console.log('working');
					}
				}
			}
		});
		var mouseOutListener = google.maps.event.addListener(markerArray[h], 'mouseout', function() {
			var mouseoutIndex = this.index;
			//console.log(mouseoutIndex + ', 클릭한 도시 개수 : ' + markerIndexArray.length);
			
			//클릭한 도시가 없을때
			if(markerIndexArray.length == 0) {
				markerArray[mouseoutIndex].setIcon(markerIcon2);
			} else {	//클릭한 도시가 있을때
				var count = 0;
				for(var j=0; j<markerIndexArray.length; j++) {
					if(count == 1) {
						return;
					}
					//만약 클릭한 도시의 번호와 마우스가 올려져있는 마커의 도시 번호가 같다면
					//마커 이미지를 빨간색으로 보여준다.
					if(mouseoutIndex == markerIndexArray[j]) {
						count++;
						//console.log('클릭한 도시 번호 : ' + markerIndexArray[j]);
						markerArray[mouseoutIndex].setIcon(markerIcon1);
						//console.log('mouseout not working');
					} else if(mouseoutIndex != markerIndexArray[j]) {
						//만약 클릭한 도시의 번호와 마우스가 올려져있는 마커의 도시 번호가 같지 않다면
						//마커 이미지를 파란색으로 보여준다.
						//console.log('클릭한 도시 번호 : ' + markerIndexArray[j]);
						markerArray[mouseoutIndex].setIcon(markerIcon2);
						//console.log('mouseout working');
					}
				}
			}
		});
	}
}
	
function poly(pathArray) {
	console.log('-------poly on-------');
	//polyline 끝을 화살표 모양으로 표시하기 위한 코드
	var lineSymbol = {
		path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
	};
	
	var pathLine = new google.maps.Polyline({
		path: pathArray,
		geodesic: true,
		strokeColor: '#ff0000',
		strokeOpacity: 1.0,
		strokeWeight: 2,
		icons: [{
			icon: lineSymbol,
			offset: '100%'
		}],
	});
	pathLine.setMap(map);
	lineArray.push(pathLine);
	console.log('getPath : ' + pathLine.getPath().getArray().toString());
}

//이동경로를 찍거나 제거하기 위한 함수
function lineFunction(pathArray, flag){
	console.log('-------lineFunction on-------');
	//console.log('pathArray 길이 : ' + pathArray.length);
	//console.log('flag : ' + flag);
	
	if(flag == true) {
		poly(pathArray);
		
	} else if(flag == false) {
		console.log('lineRemoveIndex : ' + lineRemoveIndex);
		pathArray.splice(lineRemoveIndex, 1);
		console.log('lineArray 길이 : ' + lineArray.length);
		var maxLength = lineArray.length;
		
		if(lineRemoveIndex > 0 && lineRemoveIndex < maxLength && maxLength >= 2) {
			//선택한 도시가 2개 이상일때 처음과 끝 제외한 모든 중간 요소 제거
			console.log('lineRemoveIndex > 0 && lineRemoveIndex < maxLength && maxLength >= 2');
			lineArray[lineRemoveIndex].setMap(null);
			lineArray.splice(lineRemoveIndex, 1);
			lineArray[lineRemoveIndex-1].setMap(null);
			lineArray.splice(lineRemoveIndex-1, 1);
			poly(pathArray);
		}/* else if(lineRemoveIndex == 1 && maxLength == 1) {
			//선택한 도시가 2개 일때 두번째 요소 제거(마지막요소)
			console.log('lineRemoveIndex > 0 && maxLength == 1');
			lineArray[lineRemoveIndex-1].setMap(null);
			lineArray.splice(lineRemoveIndex-1, 1);
			poly(pathArray);
		}*/ else if(maxLength == lineRemoveIndex && maxLength >= 1) {
			//선택한 도시가 1개 이상일때 마지막 요소 제거
			console.log('maxLength == lineRemoveIndex && maxLength >= 1');
			lineArray[lineRemoveIndex-1].setMap(null);
			lineArray.splice(lineRemoveIndex-1, 1);
		} else if(lineRemoveIndex == 0 && maxLength >= 1) {
			//선택한 도시 1개 이상일때 첫번째 요소 제거
			console.log('lineRemoveIndex == 0 && maxLength >= 1');
			lineArray[lineRemoveIndex].setMap(null);
			lineArray.splice(lineRemoveIndex, 1);
		} else if(lineRemoveIndex == 0 && maxLength < 1) {
			//선택한 도시 하나일때 그 요소 제거
			console.log('lineRemoveIndex == 0 && maxLength < 1');
			lineArray.splice(lineRemoveIndex, 1);
		}
	}
};

//이동경로에서 클릭한 도시를 제거하기 위한 함수
function lineRemoveFunction(removeButtonIndex) {
	console.log('-------lineRemoveFunction on-------');
	//console.log('removeButtonIndex : ' + removeButtonIndex);
	lineRemoveIndex = removeButtonIndex;
	
	//pathArray 배열에서 선택한 도시의 좌표를 제거한다.
	var markerIndexTemp = markerIndexArray[removeButtonIndex];
	console.log(markerIndexArray + ' 중 제거할 도시번호 : ' + markerIndexTemp);
	markerIndexArray.splice(removeButtonIndex, 1);
	markerArray[markerIndexTemp].setIcon(markerIcon2);
	
	var removeLatitude = Number(cityInfoList[markerIndexTemp].latitude);
	var removeLangitude = Number(cityInfoList[markerIndexTemp].langitude);
	//console.log(markerIndexTemp + ' : ' + removeLatitude + ', ' + removeLangitude);
	
	//pathArray.pop({lat: removeLatitude, lng: removeLangitude});
	//console.log('pathArray 길이 : ' + pathArray.length);
	for(var i=0; i<pathArray.length; i++) {
		console.log(pathArray[i]);
	}
	
	if(pathArray.length >= 1) {
		flag = false;
		lineFunction(pathArray, flag);
	}
}

$(document).ready(function() {
	var $stayCount = 0;
	
	$('.cityInfoLi').click(function() {
    	var cityInfoIndex = $('.cityInfoLi').index(this);
    	//console.log('클릭한 도시 번호 : ' + cityInfoIndex + ', 도시 이름 : ' + cityInfoList[cityInfoIndex].name);
    	var zoomLatitude = Number(cityInfoList[cityInfoIndex].latitude);
    	var zoomLangitude = Number(cityInfoList[cityInfoIndex].langitude);
    	
    	var zoomCity = {lat: zoomLatitude, lng: zoomLangitude};
    	map.setZoom(10);
		map.setCenter(zoomCity);
    });
	
	//removeButton 이미지 태그를 클릭했을때 실행할 함수
	$('body').on('click', '.removeButton', function() {
		//클릭한 태그의 번호를 가져와서 그 번호에 해당하는 li 태그를 제거한다.
		var removeButtonIndex = $('.removeButton').index(this);
		//console.log('removeButtonIndex : ' + removeButtonIndex);
		
		//이동 경로에서 removeButton 이미지를 클릭한 도시 제거
		lineRemoveFunction(removeButtonIndex);
		
		console.log(Number($('.stayCount').eq(removeButtonIndex).text()));
		$stayDay -= Number($('.stayCount').eq(removeButtonIndex).text());
		$('#stayDay').val($stayDay);
		
		//경로 제거후 li 태그 제거
		$('.leftMenuLi').eq(removeButtonIndex).remove();
	});
	
	//arrowLeft 이미지 태그를 클릭했을때 실행할 함수
	$('body').on('click', '.arrowLeft', function() {
		//클릭할때마다 일 수를 1씩 뺀다.
		var liIndex = $('.arrowLeft').index(this);
		console.log(liIndex);
		$stayCount = Number($('.stayCount').eq(liIndex).text());
		if($stayCount > 1) {
			$stayCount-=1;
			$('.stayCount').eq(liIndex).text($stayCount);
		}
		if($stayDay > 1) {
			$stayDay -= 1;
			$('#stayDay').val($stayDay);
		}
	});
	//arrowRight 이미지 태그를 클릭했을때 실행할 함수
	$('body').on('click', '.arrowRight', function() {
		//클릭할때마다 일 수를 1씩 더한다.
		var liIndex = $('.arrowRight').index(this);
		console.log(liIndex);
		$stayCount = Number($('.stayCount').eq(liIndex).text());
		if($stayCount >= 1) {
			$stayCount+=1;
			$('.stayCount').eq(liIndex).text($stayCount);
		}
		$stayDay += 1;
		$('#stayDay').val($stayDay);
	});
	
	$('body').on('click', '#mainPlanDivLeft3Close', function() {
		$('#mainPlanDivLeft3').animate({"left":"0px"});
	});
	
	var clickIcon;
	function test() {
		$.ajax({
			url:'/plan/RESTTotalInfo',
			data:{clickCityName:clickCityName, clickIcon:clickIcon},
			type:'GET',
			success:function(data){
				$('#leftMenuList').html(data);
			}
		})
	}
	
	var clickCityName;
	//cityName li 태그를 클릭했을때 실행할 함수
	$('body').on('click', '.cityName', function() {
		var cityClickIndex = $('.cityName').index(this);
		clickCityName = $('.cityName').eq(cityClickIndex).text();
		console.log(cityClickIndex + '번째 도시 : ' + clickCityName);
		$('#clickCityName').text(clickCityName);
		
		clickIcon = "명소";
		test();
		
		$('#mainPlanDivLeft3').show().animate({"left":"320px"});
		//$('#mainPlanlandmarkIcon').attr('src', '../../resources/images/planIcon/landmarkIconClick.png');
	});
	
	var $src;
	$('.iconImg').click(function(){
		$('.iconImg').removeClass('onIcon');
		if(!($(this).hasClass('onIcon'))){
			$(this).addClass('onIcon');
			
			var tabIconIndex = $('.iconImg').index(this);
			console.log(tabIconIndex);
			
			if(tabIconIndex == 0) {
				clickIcon = '명소';
			} else if(tabIconIndex == 1) {
				clickIcon = '식당';
			} else if(tabIconIndex == 2) {
				clickIcon = '숙소';
			} else if(tabIconIndex == 3) {
				clickIcon = '축제';
			} 
			test();
		}
	});
});
