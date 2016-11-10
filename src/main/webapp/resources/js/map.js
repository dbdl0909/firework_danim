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

//landmark 마커를 담은 배열
var $landmarkMarkerArray = [];

//landmark 마커 hover
var $hoverTemp = false;
var $landmarkHoverIndex = 0;

var liIndex = 0;
var stayCount = 0;

//도시루트에 도시가 추가되었는지 확인하기 위해 사용할 변수
var cityRouteLiIndex = 0;
var $temp = 0;
//도시루트에 도시가 추가되었을때 stayCount 초기값 담는 변수
//var stayCountInit = 0;
//도시에 머물 일 수가 변경되었는지 체크하는 변수
var cityStayDayChange = false;
//도시에 머물 일 수가 변경된 태그가 몇번째인지 담는 변수
//var $stayCountIndex = 0;

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

//날짜 수정될때마다 도시루트 시작날짜, 종료날짜 셋팅(일정표에 담을것)
function cityRouteDateSet() {
	//console.log('종료일 셋팅 후 hidden에 값 넣기!');
	//console.log('cityRouteLiIndex(li) : ' + cityRouteLiIndex);
	
	//mainPlan페이지에 처음 들어왔을때의 출발일
	//console.log('출발일 init : ' + startDateInit);
	
	var cityStartDate = document.getElementById('startDate').valueAsDate;
	//console.log('cityStartDate : ' + cityStartDate);
	var cityEndDate = document.getElementById('endDate').valueAsDate;
	//console.log('cityEndDate : ' + cityEndDate);
	
	var cityEndDateTemp = new Date();
	
	//console.log('cityRouteLiIndex : ' + cityRouteLiIndex);
	
	if(startDateInit.toString() == cityStartDate.toString()) {			//출발일이 변경되지 않았을 경우
		//console.log('출발일이 변경되지 않았을 경우');
		
		if(cityStayDayChange == false) {
			//console.log('도시에 머물 일 수 변경X');
			
			cityStayCount = 1;
			//console.log('머물 일 : ' + cityStayCount);
			
			if(cityRouteLiIndex == 0) {
				//console.log('cityRouteLiIndex : ' + cityRouteLiIndex);
				//처음 루트에 도시가 추가되었을때 0번째(li)의 startDate에 출발일 담는다.
				document.getElementsByClassName('cityRouteStartDate')[cityRouteLiIndex].valueAsDate = cityStartDate;
				//console.log(cityRouteLiIndex + '번째 도시 출발일 : ' + document.getElementsByClassName('cityRouteStartDate')[cityRouteLiIndex].value);
				
				//처음 루트에 도시가 추가되었을때 0번째(li)의 endDate에 종료일 담는다.
				document.getElementsByClassName('cityRouteEndDate')[cityRouteLiIndex].valueAsDate = cityEndDate;
				//console.log(cityRouteLiIndex + '번째 도시 종료일 : ' + document.getElementsByClassName('cityRouteEndDate')[cityRouteLiIndex].value);
				
				//console.log('-----------------------------');
			} else {
				//console.log('cityRouteLiIndex : ' + cityRouteLiIndex);
				//처음 루트에 도시가 추가되었을때 cityRouteLiIndex번째(li)의 startDate에 출발일 담는다.
				document.getElementsByClassName('cityRouteStartDate')[cityRouteLiIndex].valueAsDate = document.getElementsByClassName('cityRouteEndDate')[cityRouteLiIndex-1].valueAsDate;
				//console.log(cityRouteLiIndex + '번째 도시 출발일 : ' + document.getElementsByClassName('cityRouteStartDate')[cityRouteLiIndex].value);
				
				//처음 루트에 도시가 추가되었을때 cityRouteLiIndex번째(li)의 endDate에 종료일 담는다.
				document.getElementsByClassName('cityRouteEndDate')[cityRouteLiIndex].valueAsDate = cityEndDate;
				//console.log(cityRouteLiIndex + '번째 도시 종료일 : ' + document.getElementsByClassName('cityRouteEndDate')[cityRouteLiIndex].value);
				
				//console.log('-----------------------------');
			}
		} else if(cityStayDayChange == true) {		//도시에 머물 일 수가 변경되었을 경우
			//console.log('도시에 머물 일 수 변경O');
			
			cityStayCount = Number(document.getElementsByClassName('stayCount')[liIndex].value);
			//console.log('머물 일 : ' + cityStayCount);
			
			var cityStartDateTemp = new Date(document.getElementsByClassName('cityRouteStartDate')[liIndex].valueAsDate);
			var yearTemp = cityStartDateTemp.getFullYear();
			var monthTemp = cityStartDateTemp.getMonth()+1;
			var dateTemp = cityStartDateTemp.getDate();
			
			cityEndDateTemp.setFullYear(yearTemp);
			cityEndDateTemp.setMonth(monthTemp-1);
			cityEndDateTemp.setDate(dateTemp+cityStayCount-1);
			
			document.getElementsByClassName('cityRouteEndDate')[liIndex].valueAsDate = cityEndDateTemp;
			//console.log(liIndex + '번째 도시 출발일 : ' + document.getElementsByClassName('cityRouteStartDate')[liIndex].value);
			//console.log(liIndex + '번째 도시 종료일 : ' + document.getElementsByClassName('cityRouteEndDate')[liIndex].value);
			
			//console.log('-----------------------------');
		}
		
	} else if(startDateInit.toString() != cityStartDate.toString()) {		//출발일이 변경되었을 경우
		/*console.log('출발일이 변경되었을 경우');
		
		for(var i=0; i<$('.leftMenuLi').length; i++) {
			if(i == 0) {
				//0번째
				document.getElementsByClassName('cityRouteStartDate')[i].valueAsDate = cityStartDate;
				console.log(i + '번째 도시 출발일 : ' + document.getElementsByClassName('cityRouteStartDate')[i].value);
				
				document.getElementsByClassName('cityRouteEndDate')[i].valueAsDate = cityEndDate;
				console.log(i + '번째 도시 종료일 : ' + document.getElementsByClassName('cityRouteEndDate')[i].value);
			} else {
				
			}
		}*/
		
	}
	
}

function infoWindowEvent() {
	var infoNoArray = [];
    var infoNameArray = [];
	var infoSummaryArray = [];
	var infoImageArray = [];
	var prevInfowindow = false;
	
	for(var i = 0; i < markerArray.length; i++) {
		//infoArray 배열에 차례대로 각 도시의 name, summary, image들을 담는다.
		infoNoArray.push(cityInfoList[i].no);
		infoNameArray.push(cityInfoList[i].name);
		infoSummaryArray.push(cityInfoList[i].summary);
		infoImageArray.push(cityInfoList[i].image);
		
		//makrerArray의 i번째를 클릭했을때 실행할 함수
		google.maps.event.addListener(markerArray[i], 'click', function() {
			markerIndex = this.index;
			//console.log(markerIndex + '번째 도시 : ' + infoNameArray[markerIndex]);
			
			//시 마커를 클릭했을때 보여줄 내용을 담은 함수
			var infowindow = new google.maps.InfoWindow({
				content: "<img id='mainPlanCityInfoImage' src='" + infoImageArray[markerIndex] + "'/>" +
						 "<input id='mainPlanCityinfoNo' type='hidden' value='" + infoNoArray[markerIndex] +  "'/>" +
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
			    		//console.log(markerIndex);
			    		markerArray[markerIndex].setIcon(markerIcon1);
			    		markerArray[markerIndex].setVisible(true);
			    		
			    		markerIndexArray.push(markerIndex);
			    		//console.log('markerIndexArray 길이 : ' + markerIndexArray.length);
			    		$('#mainPlanUl').append(
		    				"<li class='leftMenuLi'>" +
								"<span class='cityName' name='cityRouteDepartureCity'>" + infoNameArray[markerIndex] + "</span>" +
								"<input class='cityRouteArrivalCity' name='cityRouteArrivalCity' type='hidden'/>" +
								"<input class='cityInfoNo' type='hidden' value='" + infoNoArray[markerIndex] +"'/>" +
								"<input class='cityNo' type='hidden' value='" + markerIndex + "'/>" +
								"<img class='removeButton' id='mainPlanRemoveButton' src='../../resources/images/planIcon/removeButton.png'/>" +
								"<div class='cityChooseMenu'>" +
									"<img class='arrowLeft' src='../../resources/images/planIcon/arrowPointingToLeft.png'/>" +
									"<input class='stayCount' type='text' value='1' style='border:0;'/>일" +
									"<img class='arrowRight' src='../../resources/images/planIcon/arrowPointingToRight.png'/>" +
								"</div>" +
								"<div class='cityRouteTime'>" +
									"<label for='startTime'>startTime</label>"+
									"<input type='time' name='cityRouteDepartureTime' class='startTime'/>"+
									"<label for='endTime'>endTime</label>"+
									"<input type='time' name='cityRouteArrivalTime' class='endTime'/>"+
								"</div>" +
								"<div class='landmarkListDiv'>" +
									"<span class='landmarkListSpan'>명소 루트</span>" +
									"<img class='landmarkListSlideCheck' src='../../resources/images/planIcon/downArrow.png'>" +
								"</div>" +
								"<div class='landmarkListSlide'>" +
									"<ul class='landmarkRouteUl'>" +
									"</ul>" +
								"</div>" +
								"<div>" +
/*날짜넘기기*/						"<input type='date' class='cityRouteStartDate' name='cityRouteStartDate' style='display:none;width:100%'/>" +
									"<input type='date' class='cityRouteEndDate' style='display:none;width:100%'/>" +
								"</div>" +
							"</li>"
						);
			    		//차례대로 숙박일수 조정 시는 잘나오는데, 중간에서 숙박일수 조정시  다음 루트의 시간변동이 이루어지지 않음
			    		//stayCountInit = document.getElementsByClassName('stayCount')[cityRouteLiIndex].value;
			    		//console.log('stayCountInit : ' + stayCountInit);
			    		
 			    		$stayDay = Number(document.getElementById('stayDay').value);
			    		if(stayCount > 0) {
			    			$stayDay += 1;
			    		}
			    		document.getElementById('stayDay').value = Number($stayDay);
			    		//console.log('stayDay : ' + document.getElementById('stayDay').value);
			    		
			    		//도시 하나마다 출발일 종료일 설정하는 함수(일정표)
			    		cityStayDayChange = false;
			    		cityRouteDateSet();
		    		
			    		//도시루트에 도시 하나씩 추가마다 +1
			    		cityRouteLiIndex++;
			    		//console.log('cityRouteLiIndex : ' + cityRouteLiIndex);
			    		
			    		//클릭한 도시만 리스트로 받아와서 이동경로(line)를 추가해야한다!!
						var latitude = Number(cityInfoList[markerIndex].latitude);
						var langitude = Number(cityInfoList[markerIndex].langitude); 
						//console.log(markerIndex + ' : ' + latitude + ', ' + langitude);
						
						//pathArray 배열에 클릭한 도시의 좌표를 누적시키기 위해 전역변수로 둔다.
						pathArray.push({lat: latitude, lng: langitude});
						//console.log('pathArray 길이 : ' + pathArray.length);
			    		
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
						
						stayCount++;
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
		//console.log(zoom);
		
		//zoom이 10일때부터 다른 모든 시들도 보여준다.
		if(zoom >= 10) {
			for(var i=0; i<=72; i++) {
				markerArray[i].setVisible(true);
			}
		} else if(zoom <= 8) {	//zoom이 8됬을때 다시 광역시만 보여준다. 클릭한 도시는 지우지 않고 그대로 보여준다.
			//console.log('클릭한 도시 개수 : ' + markerIndexArray.length);
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
	//console.log('getPath : ' + pathLine.getPath().getArray().toString());
}

//이동경로를 찍거나 제거하기 위한 함수
function lineFunction(pathArray, flag){
	//console.log('-------lineFunction on-------');
	//console.log('pathArray 길이 : ' + pathArray.length);
	//console.log('flag : ' + flag);
	
	if(flag == true) {
		poly(pathArray);
		//console.log('pathArray 길이 : ' + pathArray.length);
		
	} else if(flag == false) {
		//console.log('lineRemoveIndex : ' + lineRemoveIndex);
		pathArray.splice(lineRemoveIndex, 1);
		//console.log('pathArray 길이 : ' + pathArray.length);
		//console.log('lineArray 길이 : ' + lineArray.length);
		var maxLength = lineArray.length;
		
		if(lineRemoveIndex > 0 && lineRemoveIndex < maxLength && maxLength >= 2) {
			//선택한 도시가 2개 이상일때 처음과 끝 제외한 모든 중간 요소 제거
			//console.log('lineRemoveIndex > 0 && lineRemoveIndex < maxLength && maxLength >= 2');
			
			for(var i=0; i<maxLength; i++) {
				lineArray[i].setMap(null);
			}
			lineArray = [];
			poly(pathArray);
			
			/*for(var i=0; i<2; i++) {
				lineArray[lineRemoveIndex-1].setMap(null);
				lineArray.splice(lineRemoveIndex-1, 1);
			}
			lineArray[lineRemoveIndex].setMap(null);
			lineArray.splice(lineRemoveIndex, 1);
			lineArray[lineRemoveIndex-1].setMap(null);
			lineArray.splice(lineRemoveIndex-1, 1);
			poly(pathArray);*/
			
		} else if(maxLength == lineRemoveIndex && maxLength >= 1) {
			//선택한 도시가 1개 이상일때 마지막 요소 제거
			//console.log('maxLength == lineRemoveIndex && maxLength >= 1');
			lineArray[lineRemoveIndex-1].setMap(null);
			lineArray.splice(lineRemoveIndex-1, 1);
		} else if(lineRemoveIndex == 0 && maxLength >= 1) {
			//선택한 도시 1개 이상일때 첫번째 요소 제거
			//console.log('lineRemoveIndex == 0 && maxLength >= 1');
			lineArray[lineRemoveIndex].setMap(null);
			lineArray.splice(lineRemoveIndex, 1);
		} else if(lineRemoveIndex == 0 && maxLength < 1) {
			//선택한 도시 하나일때 그 요소 제거
			//console.log('lineRemoveIndex == 0 && maxLength < 1');
			lineArray.splice(lineRemoveIndex, 1);
		}
	}
};

//이동경로에서 클릭한 도시를 제거하기 위한 함수
function lineRemoveFunction(removeButtonIndex) {
	//console.log('-------lineRemoveFunction on-------');
	//console.log('removeButtonIndex : ' + removeButtonIndex);
	lineRemoveIndex = removeButtonIndex;
	
	//pathArray 배열에서 선택한 도시의 좌표를 제거한다.
	var markerIndexTemp = markerIndexArray[removeButtonIndex];
	//console.log(markerIndexArray + ' 중 제거할 도시번호 : ' + markerIndexTemp);
	markerIndexArray.splice(removeButtonIndex, 1);
	markerArray[markerIndexTemp].setIcon(markerIcon2);
	
	var removeLatitude = Number(cityInfoList[markerIndexTemp].latitude);
	var removeLangitude = Number(cityInfoList[markerIndexTemp].langitude);
	//console.log(markerIndexTemp + ' : ' + removeLatitude + ', ' + removeLangitude);
	
	//pathArray.pop({lat: removeLatitude, lng: removeLangitude});
	//console.log('pathArray 길이 : ' + pathArray.length);
	/*for(var i=0; i<pathArray.length; i++) {
		console.log(pathArray[i]);
	}*/
	
	if(pathArray.length >= 1) {
		flag = false;
		lineFunction(pathArray, flag);
	}
}

function landmarkHover($hoverTemp, $landmarkHoverIndex) {
	if($hoverTemp == false) {
		$landmarkMarkerArray[$landmarkHoverIndex].setIcon('../../resources/images/planIcon/landmarkPinClick.png');
	} else {
		$landmarkMarkerArray[$landmarkHoverIndex].setIcon('../../resources/images/planIcon/landmarkPin.png');
	}
}

$(document).ready(function() {
	var $stayCount = 0;
	$('.cityInfoLi').click(function() {
		cityInfoIndex = $('.cityInfoLi').index(this);
    	//console.log('클릭한 도시 번호 : ' + cityInfoIndex + ', 도시 이름 : ' + cityInfoList[cityInfoIndex].name);
    	var zoomLatitude = Number(cityInfoList[cityInfoIndex].latitude);
    	var zoomLangitude = Number(cityInfoList[cityInfoIndex].langitude);
    	
    	var zoomCity = {lat: zoomLatitude, lng: zoomLangitude};
    	map.setCenter(zoomCity);
    	map.setZoom(10);
    });
	
	//removeButton 이미지 태그를 클릭했을때 실행할 함수
	$('body').on('click', '.removeButton', function() {
		//클릭한 태그의 번호를 가져와서 그 번호에 해당하는 li 태그를 제거한다.
		var removeButtonIndex = $('.removeButton').index(this);
		//console.log('removeButtonIndex : ' + removeButtonIndex);
		
		//이동 경로에서 removeButton 이미지를 클릭한 도시 제거
		lineRemoveFunction(removeButtonIndex);
		
		//console.log(Number($('.stayCount').eq(removeButtonIndex).val()));
		if($stayDay > 0) {
			$stayDay -= Number($('.stayCount').eq(removeButtonIndex).val());
			$('#stayDay').val($stayDay + 1);
		}
		
		//경로 제거후 li 태그 제거
		$('.leftMenuLi').eq(removeButtonIndex).remove();
		
		if(!$('#mainPlanUl').hasClass('leftMenuLi')) {
			stayCount = 0;
		}
	});
	
	//출발일이 변경되었을때 실행할 함수
	$('#startDate').on('change', function() {
		var startDateChange = $('#startDate').val();
		//console.log('출발일 변경 : ' + startDateChange);
		
		cityRouteDateSet();
	});
	
	//arrowLeft 이미지 태그를 클릭했을때 실행할 함수
	$('body').on('click', '.arrowLeft', function() {
		//클릭할때마다 일 수를 1씩 뺀다.
		liIndex = $('.arrowLeft').index(this);
		//console.log(liIndex);
		$stayCount = Number($('.stayCount').eq(liIndex).val());
		if($stayCount > 1 || $stayDay > 1) {
			$stayCount-=1;
			$('.stayCount').eq(liIndex).val($stayCount);
			
			$stayDay -= 1;
			$('#stayDay').val($stayDay);
		}
		
		cityStayDayChange = true;
		cityRouteDateSet();
	});
	//arrowRight 이미지 태그를 클릭했을때 실행할 함수
	$('body').on('click', '.arrowRight', function() {
		//클릭할때마다 일 수를 1씩 더한다.
		liIndex = $('.arrowRight').index(this);
		//console.log(liIndex);
		$stayCount = Number($('.stayCount').eq(liIndex).val());
		if($stayCount >= 1) {
			$stayCount+=1;
			$('.stayCount').eq(liIndex).val($stayCount);
		}
		$stayDay += 1;
		$('#stayDay').val($stayDay);
		
		cityStayDayChange = true;
		cityRouteDateSet();
	});	
	
	/*$('.stayCount').change(function() {
		console.log('바뀐다');
		$stayCountIndex = $('.stayCount').index(this);
		console.log('일 바뀐 도시 : ' + $stayCountIndex);
		
		var stayCountChange = $('.stayCount').eq($stayCountIndex).val();
		console.log('도시에 머물 일 변경 : ' + stayCountChange);
		
		//cityRouteDateSet();
	});*/
	
	$('body').on('click', '#mainPlanDivLeft3Close', function() {
		$('#mainPlanDivLeft3').animate({"left":"0px"});
		
		//해당 도시의 명소 마커들 제거
		for(var i=0; i<$landmarkMarkerArray.length; i++) {
			$landmarkMarkerArray[i].setMap(null);
		}
	});
	
	//어떤 이미지를 클릭했는지 담을 변수(명소, 식당, 숙소, 축제)
	var clickIcon;
	//얼만큼 보여줄 것인지 index를 담을 변수
	var totalMoreView = 0;
	var eateryMoreView = 0;
	var stayMoreView = 0;
	var eventMoreView = 0;
	
	//landmark의 좌표를 찍을 배열
	var landmarkMarker = [];
	var landmarkPosition = [];
	var landmarkName = [];
	var landmarkNo = [];
	var landmarkCount = 0;
	
	var cityClickIndex = 0;
	var clickCityName;
	var clickCityNo;
	
	//ajax로 받아오는 값 초기화
	var count = 0;
	var temp = 0;
	
	function totalInfoList() {
		//console.log('totalMoreView : ' + totalMoreView);
		
		if(clickIcon == '식당') {
			eateryMoreView += 13;
			totalMoreView = eateryMoreView;
		} else if(clickIcon == '숙소') {
			stayMoreView += 13;
			totalMoreView = stayMoreView;
		} else if(clickIcon == '축제') {
			eventMoreView += 13;
			totalMoreView = eventMoreView;
		}
		
		$.ajax({
			url:'/plan/RESTTotalInfo',
			data:{clickCityName:clickCityName, clickIcon:clickIcon, infoMoreView:totalMoreView},
			type:'GET',
			success:function(data){
				count++;
				if(temp != count) {
					landmarkMarker = [];
					$landmarkMarkerArray = [];
					landmarkPosition = [];
					landmarkName = [];
					landmarkNo = [];
				}
				
				$('#mainPlanTotalInfoUl').html(data);
				
				landmarkCount = $('#listLandmarkCount').val();
				//console.log('landmarkCount : ' + landmarkCount);
				
				for (var i=0; i<landmarkCount; i++) {
					landmarkPosition.push({lat: Number($('.landmarkInfoLatitude').eq(i).val()), lng: Number($('.landmarkInfoLangitude').eq(i).val())});
					landmarkName.push($('.landmarkInfoName').eq(i).text());
					landmarkNo.push($('.landmarkInfoNo').eq(i).val());
					//console.log(landmarkName[i]);
				}
				
				//landmarkInfoList의 length만큼 마커를 찍어준다.
				for (var i=0; i<landmarkCount; i++) {
					landmarkMarker = new google.maps.Marker({
						icon: '../../resources/images/planIcon/landmarkPin.png',
						position: landmarkPosition[i],
						map: map,
						title: landmarkName[i],
						//zIndex: cityInfoList[i][3],
						index:i
					});
					landmarkMarker.setVisible(true);
					$landmarkMarkerArray.push(landmarkMarker);
				}
				
				for(var i=0; i<landmarkCount; i++) {
					google.maps.event.addListener($landmarkMarkerArray[i], 'mouseover', function() {
						var landmarkMouseOverIndex = this.index;
						
						$landmarkMarkerArray[landmarkMouseOverIndex].setIcon('../../resources/images/planIcon/landmarkPinClick.png');
					});
					google.maps.event.addListener($landmarkMarkerArray[i], 'mouseout', function() {
						var landmarkMouseOutIndex = this.index;
						
						$landmarkMarkerArray[landmarkMouseOutIndex].setIcon('../../resources/images/planIcon/landmarkPin.png');
					});
				}
				
				$('.clickLandmark').on('mouseover', function() {
					$hoverTemp = false;
					$landmarkHoverIndex = $('.clickLandmark').index(this);
					//console.log($landmarkHoverIndex + '번째 랜드마크');
					
					landmarkHover($hoverTemp, $landmarkHoverIndex);
					
				}).on('mouseout', function() {
					$hoverTemp = true;
					$landmarkHoverIndex = $('.clickLandmark').index(this);
					
					landmarkHover($hoverTemp, $landmarkHoverIndex);
				});
				
				$('.clickLandmark').click(function() {
					var clickLandmarkIndex = $('.clickLandmark').index(this);
					//console.log(clickCityName + '--> clickLandmarkIndex : ' + clickLandmarkIndex);
					
					var landmarkInfoNo = landmarkNo[clickLandmarkIndex];
					var clickLandmark = landmarkName[clickLandmarkIndex];
					//console.log($('.landmarkInfoLangitude').eq(clickLandmarkIndex).val());
					//console.log($('.landmarkInfoLatitude').eq(clickLandmarkIndex).val());
					
					//console.log(landmarkInfoNo + ', ' + clickCityName);
					
					$('#landmarkInfoPopWrap').show();
					
					$.ajax({
						url:'http://localhost/search/landmarkInfo',
						data:{landmarkInfoNo:landmarkInfoNo, cityInfoName:clickCityName},
						type:'GET',
						success:function(data){
							var $body = $(data).filter('.container');
							//console.log($body);
							$('#landmarkInfoPopContent').html($body);
							
							//명소 상세보기 팝업창 닫기
							$('#landmarkInfoPopClose').click(function() {
								$('#landmarkInfoPopWrap').hide();
							});
							
							//클릭한 명소 루트에 추가하기
							$('#addToPlan').click(function() {
								var  result = confirm(clickLandmark + '를 추가하시겠습니까?');
								if (result == true) {
									//console.log('도시 클릭한 것' + cityClickIndex);
									$('.landmarkRouteUl').eq(cityClickIndex).append(
										"<li class='landmarkLi'>" +
											"<span class='landmarkName'>" + clickLandmark + "</span>" +
											"<input type='hidden' class='landmarkPlanNo' name='landmarkPlanNo' value='" + landmarkInfoNo + "'/>" +
										"</li>"
									);
									//$landmarkMarkerArray[clickLandmarkIndex].setIcon('../../resources/images/planIcon/landmarkPinClick.png');
									$('#landmarkInfoPopWrap').hide();
								}
							});
						}
					})
					
				});
			}
		})
	}

	
	//cityName li 태그를 클릭했을때 실행할 함수
	$('body').on('click', '.cityName', function() {
		cityClickIndex = $('.cityName').index(this);
		
		clickCityName = $('.cityName').eq(cityClickIndex).text();
		clickCityNo = $('.cityNo').eq(cityClickIndex).val();
		//console.log(cityClickIndex + ' 번째 li 의 ' + clickCityNo + ' 번째 도시 : ' + clickCityName);
		
		
		$('#clickCityName').text(clickCityName);
		
		map.setCenter(markerArray[clickCityNo].getPosition());
		map.setZoom(12);
		
		clickIcon = "명소";
		totalInfoList();
		
		$('#mainPlanDivLeft3').show().animate({"left":"320px"});
		//$('#mainPlanlandmarkIcon').attr('src', '../../resources/images/planIcon/landmarkIconClick.png');
	});
	
	var $src;
	$('.iconImg').click(function(){
		$('.iconImg').removeClass('onIcon');
		if(!($(this).hasClass('onIcon'))){
			$(this).addClass('onIcon');
			
			var tabIconIndex = $('.iconImg').index(this);
			//console.log(tabIconIndex);
			
			if(tabIconIndex == 0) {
				clickIcon = '명소';
			} else if(tabIconIndex == 1) {
				clickIcon = '식당';
			} else if(tabIconIndex == 2) {
				clickIcon = '숙소';
			} else if(tabIconIndex == 3) {
				clickIcon = '축제';
			}
			
			totalInfoList();
			$('#mainPlanTotalInfoUl').scrollTop(0);
		}
	});
	
	var index = 1;
	var count = 1;
	$('#mainPlanTotalInfoUl').scroll(function () {
		var scrollHeight = $('#mainPlanTotalInfoUl').scrollTop();
		//console.log(scrollHeight);
		
		if(scrollHeight >= index) {
			//console.log('DB 다시 실행');
			//console.log('index : ' + index);
			index = ($('#mainPlanTotalInfoUl').height() * count);
			count++;
			
			totalInfoList();
		}
	});
	
	//명소루트 슬라이드
	var slideOnOff = false;
	var slideOn = "../../resources/images/planIcon/upArrow.png";
	var slideOff = "../../resources/images/planIcon/downArrow.png";
	$('body').on('click', '.landmarkListDiv', function() {
		var landmarkListDivIndex = $('.landmarkListDiv').index(this);
		if(slideOnOff == false) {
			$('.landmarkListSlideCheck').eq(landmarkListDivIndex).attr('src', slideOn);
			
			$(".landmarkListSlide").eq(landmarkListDivIndex).slideDown("normal", function() {
				slideOnOff = true;
				//console.log('명소 루트 열기');
			});
		} else {
			$('.landmarkListSlideCheck').eq(landmarkListDivIndex).attr('src', slideOff);
			
			$(".landmarkListSlide").eq(landmarkListDivIndex).slideUp("normal", function() {
				slideOnOff = false;
				//console.log('명소 루트 닫기');
			});
		}
	});
	
	//plan에 저장할 데이터들을 보내는 함수
	$('#planInfoSubmit').click(function() {
		console.log('플랜명 : ' + $('#planName').val());		//planName
		console.log('인원수 : ' + $('#planHeadcount').val());	//planHeadcount
		console.log('플랜타입 : ' + $('#planType').val());		//planType
		
		console.log('출발일 : ' + $('#startDate').val());		//startDate
		console.log('종료일 : ' + $('#endDate').val());			//endDate
		console.log('숙박일 : ' + $('#stayDay').val());			//stayDay
		
		console.log('도시 루트');
		for(var i=0; i<$('.leftMenuLi').length; i++) {
			if(i == ($('.leftMenuLi').length-1)) {
				$('.cityRouteArrivalCity').eq(i).text($('.cityName').eq(i).text());
			} else {
				$('.cityRouteArrivalCity').eq(i).text($('.cityName').eq(i+1).text());
			}
			
			console.log(i + '번째 도시 출발날짜 : ' + $('.cityRouteStartDate').eq(i).val());	//cityRouteStartDate
			
			console.log(i + '번째 출발 도시 : ' + $('.cityName').eq(i).text());					//cityRouteDepartureCity
			console.log(i + '번째 도착 도시 : ' + $('.cityRouteArrivalCity').eq(i).text());		//cityRouteArrivalCity
			
			console.log(i + '번째 도시 출발시각 : ' + $('.startTime').eq(i).val());				//cityRouteDepartureTime
			console.log(i + '번째 도시 도착시각 : ' + $('.endTime').eq(i).val());				//cityRouteArrivalTime
			
			for(var j=0; j<$('.landmarkPlanNo').length; j++) {									//landmarkPlanNo
				console.log(i + '번째 도시의 ' + j + '번째 명소 : ' + $('.landmarkPlanNo').eq(j).val());
			}
			
		}
		
		
	})
});