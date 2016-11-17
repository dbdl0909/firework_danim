/*
Monthly 2.1.0 by Kevin Thornbloom is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
*/

(function($) {
	$.fn.extend({
		monthly: function(options) {
			// These are overridden by options declared in footer
			var defaults = {
				weekStart: 'Sun',
				mode: '',
				xmlUrl: '',
				jsonUrl: '',
				dataType: 'xml',
				target: '',
				eventList: true,
				maxWidth: false,
				setWidth: false,
				startHidden: false,
				showTrigger: '',
				stylePast: false,
				disablePast: false
			}

			var options = $.extend(defaults, options),
				that = this,
				uniqueId = $(this).attr('id'),
				d = new Date(),
				currentMonth = d.getMonth() + 1,
				currentYear = d.getFullYear(),
				currentDay = d.getDate(),
				monthNames = options.monthNames || ["Jan", "Feb", "Mar", "Apr", "May", "June", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
				dayNames = options.dayNames || ['SUN','MON','TUE','WED','THU','FRI','SAT'];

		if (options.maxWidth != false){
			$('#'+uniqueId).css('maxWidth',options.maxWidth);
		}
		if (options.setWidth != false){
			$('#'+uniqueId).css('width',options.setWidth);
		}

		if (options.startHidden == true){
			$('#'+uniqueId).addClass('monthly-pop').css({
				'position' : 'absolute',
				'display' : 'none'
			});
			$(document).on('focus', ''+options.showTrigger+'', function (e) {
				$('#'+uniqueId).show();
				e.preventDefault();
			});
			$(document).on('click', ''+options.showTrigger+', .monthly-pop', function (e) {
				e.stopPropagation();
				e.preventDefault();
			});
			$(document).on('click', function (e) {
				$('#'+uniqueId).hide();
			});
		}

		// Add Day Of Week Titles
		if (options.weekStart == 'Sun') {
			$('#' + uniqueId).append('<div class="monthly-day-title-wrap"><div>'+dayNames[0]+'</div><div>'+dayNames[1]+'</div><div>'+dayNames[2]+'</div><div>'+dayNames[3]+'</div><div>'+dayNames[4]+'</div><div>'+dayNames[5]+'</div><div>'+dayNames[6]+'</div></div><div class="monthly-day-wrap"></div>');
		} else if (options.weekStart == 'Mon') {
			$('#' + uniqueId).append('<div class="monthly-day-title-wrap"><div>'+dayNames[1]+'</div><div>'+dayNames[2]+'</div><div>'+dayNames[3]+'</div><div>'+dayNames[4]+'</div><div>'+dayNames[5]+'</div><div>'+dayNames[6]+'</div><div>'+dayNames[0]+'</div></div><div class="monthly-day-wrap"></div>');
		} else {
			console.error('Monthly.js has an incorrect entry for the weekStart variable');
		}

		// Add Header & event list markup
		$('#' + uniqueId).prepend('<div class="monthly-header"><div class="monthly-header-title"><a href="#" class="monthly-header-title-date" onclick="return false"></a></div><a href="#" class="monthly-prev"></a><a href="#" class="monthly-next"></a></div>').append('<div class="monthly-event-list"></div>');

		// How many days are in this month?
		function daysInMonth(m, y){
			return m===2?y&3||!(y%25)&&y&15?28:29:30+(m+(m>>3)&1);
		}

		// Massive function to build the month
		function setMonthly(m, y){
			$('#' + uniqueId).data('setMonth', m).data('setYear', y);

			// Get number of days
			var dayQty = daysInMonth(m, y),
				// Get day of the week the first day is
				mZeroed = m -1,
				firstDay = new Date(y, mZeroed, 1, 0, 0, 0, 0).getDay();

			// Remove old days
			$('#' + uniqueId + ' .monthly-day, #' + uniqueId + ' .monthly-day-blank').remove();
			$('#'+uniqueId+' .monthly-event-list').empty();
			$('#'+uniqueId+' .monthly-day-wrap').empty();
			// Print out the days
			if (options.mode == 'event') {
				for(var i = 0; i < dayQty; i++) {

					var day = i + 1; // Fix 0 indexed days
					var dayNamenum = new Date(y, mZeroed, day, 0, 0, 0, 0).getDay()

					$('#' + uniqueId + ' .monthly-day-wrap').append('<a href="#" class="m-d monthly-day monthly-day-event" data-number="'+day+'"><div class="monthly-day-number">'+day+'</div><div class="monthly-indicator-wrap"></div></a>');
					$('#' + uniqueId + ' .monthly-event-list').append('<div class="monthly-list-item" id="'+uniqueId+'day'+day+'" data-number="'+day+'"><div class="monthly-event-list-date">'+dayNames[dayNamenum]+'<br>'+day+'</div></div>');
				}
			} else {
				for(var i = 0; i < dayQty; i++) {
					// Fix 0 indexed days
					var day = i + 1;

					// Check if it's a day in the past
					if(((day < currentDay && m === currentMonth) || y < currentYear || (m < currentMonth && y == currentYear)) && options.stylePast == true){
							$('#' + uniqueId + ' .monthly-day-wrap').append('<a href="#" class="m-d monthly-day monthly-day-pick monthly-past-day" data-number="'+day+'"><div class="monthly-day-number">'+day+'</div><div class="monthly-indicator-wrap"></div></a>');
					} else {
						$('#' + uniqueId + ' .monthly-day-wrap').append('<a href="#" class="m-d monthly-day monthly-day-pick" data-number="'+day+'"><div class="monthly-day-number">'+day+'</div><div class="monthly-indicator-wrap"></div></a>');
					}
				}
			}


			// Set Today
			var setMonth = $('#' + uniqueId).data('setMonth'),
				setYear = $('#' + uniqueId).data('setYear');
			if (setMonth == currentMonth && setYear == currentYear) {
				$('#' + uniqueId + ' *[data-number="'+currentDay+'"]').addClass('monthly-today');
			}

			// Reset button
			if (setMonth == currentMonth && setYear == currentYear) {
				$('#' + uniqueId + ' .monthly-header-title-date').html(monthNames[m - 1] +' '+ y);
			} else {
				$('#' + uniqueId + ' .monthly-header-title').html('<a href="#" class="monthly-header-title-date"  onclick="return false">'+monthNames[m - 1] +' '+ y +'</a><a href="#" class="monthly-reset" title="Set to today">↻ TODAY</a> ');
			}

			// Account for empty days at start
			if(options.weekStart == 'Sun' && firstDay != 7) {
				for(var i = 0; i < firstDay; i++) {
					$('#' + uniqueId + ' .monthly-day-wrap').prepend('<div class="m-d monthly-day-blank"><div class="monthly-day-number"></div></div>');
				}
			} else if (options.weekStart == 'Mon' && firstDay == 0) {
				for(var i = 0; i < 6; i++) {
					$('#' + uniqueId + ' .monthly-day-wrap').prepend('<div class="m-d monthly-day-blank" ><div class="monthly-day-number"></div></div>');
				}
			} else if (options.weekStart == 'Mon' && firstDay != 1) {
				for(var i = 0; i < (firstDay - 1); i++) {
					$('#' + uniqueId + ' .monthly-day-wrap').prepend('<div class="m-d monthly-day-blank" ><div class="monthly-day-number"></div></div>');
				}
			}

			//Account for empty days at end
			var numdays = $('#' + uniqueId + ' .monthly-day').length,
				numempty = $('#' + uniqueId + ' .monthly-day-blank').length,
				totaldays = numdays + numempty,
				roundup = Math.ceil(totaldays/7) * 7,
				daysdiff = roundup - totaldays;
			if(totaldays % 7 != 0) {
				for(var i = 0; i < daysdiff; i++) {
					$('#' + uniqueId + ' .monthly-day-wrap').append('<div class="m-d monthly-day-blank"><div class="monthly-day-number"></div></div>');
				}
			}
			// Events
			if (options.mode == 'event') {
				// Remove previous events

				// Add Events
				var addEvents = function(event) {
					// Year [0]   Month [1]   Day [2]
					
					var fullstartDate =  event.startDate,
						startArr = fullstartDate.split("-"),
						startYear = startArr[0],
						startMonth = parseInt(startArr[1], 10),
						startDay = parseInt(startArr[2], 10),
						fullendDate = event.endDate,
						endArr = fullendDate.split("-"),
						endYear = endArr[0],
						endMonth = parseInt(endArr[1], 10),
						endDay = parseInt(endArr[2], 10),
						endDay = endDay-1,
						eventURL = options.dataType = event.url,
						eventTitle = options.dataType = event.name,
						eventRoute = event.route,
						eventColor = options.dataType = event.color,
						eventId = options.dataType = event.id,
						startTime = options.dataType = event.startTime,
						startSplit = startTime.split(":"),
						endTime = options.dataType = event.endTime,
						endSplit = endTime.split(":"),
						eventLink = '',
						startPeriod = 'AM',
						endPeriod = 'PM';
						//alert(eventRoute)
					
						
					/* Convert times to 12 hour & determine AM or PM */
					if(parseInt(startSplit[0]) >= 12) {
						var startTime = (startSplit[0] - 12)+':'+startSplit[1]+'';
						var startPeriod = 'PM'
					}

					if(parseInt(startTime) == 0) {
						var startTime = '12:'+startSplit[1]+'';
					}

					if(parseInt(endSplit[0]) >= 12) {
						var endTime = (endSplit[0] - 12)+':'+endSplit[1]+'';
						var endPeriod = 'PM'
					}
					if(parseInt(endTime) == 0) {
						var endTime = '12:'+endSplit[1]+'';
					}
					if (eventURL){
						var eventLink = 'href="'+eventURL+'"';
					}

					// function to print out list for multi day events
					function multidaylist(){
						var timeHtml = '';
						if (startTime){
							var startTimehtml = '<div><div class="monthly-list-time-start">'+startTime+' '+startPeriod+'</div>';
							var endTimehtml = '';
							if (endTime){
								var endTimehtml = '<div class="monthly-list-time-end">'+endTime+' '+endPeriod+'</div>';
							}
							var timeHtml = startTimehtml + endTimehtml + '</div>';
						}
						$('#'+uniqueId+' .monthly-list-item[data-number="'+i+'"]').addClass('item-has-event').append('<a href="'+eventURL+'" class="listed-event clearfix"  data-eventid="'+ eventId +'" style="background:'+eventColor+'" title="'+eventTitle+'">'+eventTitle+' '+timeHtml+' <span style="font-size:11px;">'+eventRoute+'</span><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#planMemo" style="background:none; margin-top:-25px; border-color:#fff; float:right;">메모추가</button></a>');
					}


					// If event is one day & within month
					if (!fullendDate && startMonth == setMonth && startYear == setYear) {
						// Add Indicators
						$('#'+uniqueId+' *[data-number="'+startDay+'"] .monthly-indicator-wrap').append('<div class="monthly-event-indicator"  data-eventid="'+ eventId +'" style="background:'+eventColor+'" title="'+eventTitle+'">'+eventTitle+'</div>');
						// Print out event list for single day event
						var timeHtml = '';
						if (startTime){
							var startTimehtml = '<div><div class="monthly-list-time-start">'+startTime+' '+startPeriod+'</div>';
							var endTimehtml = '';
							if (endTime){
								var endTimehtml = '<div class="monthly-list-time-end">'+endTime+' '+endPeriod+'</div>';
							}
							var timeHtml = startTimehtml + endTimehtml + '</div>';
						}
						$('#'+uniqueId+' .monthly-list-item[data-number="'+startDay+'"]').addClass('item-has-event').append('<a href="'+eventURL+'" class="listed-event"  data-eventid="'+ eventId +'" style="background:'+eventColor+'" title="'+eventTitle+'">'+eventTitle+' '+timeHtml+'</a>');


						// If event is multi day & within month
					} else if (startMonth == setMonth && startYear == setYear && endMonth == setMonth && endYear == setYear){
						for(var i = parseInt(startDay); i <= parseInt(endDay); i++) {
							// If first day, add title
							if (i == parseInt(startDay)) {
								$('#'+uniqueId+' *[data-number="'+i+'"] .monthly-indicator-wrap').append('<div class="monthly-event-indicator" data-eventid="'+ eventId +'" style="background:'+eventColor+'" title="'+eventTitle+'">'+eventTitle+'</div>');
							} else {
								$('#'+uniqueId+' *[data-number="'+i+'"] .monthly-indicator-wrap').append('<div class="monthly-event-indicator" data-eventid="'+ eventId +'" style="background:'+eventColor+'" title="'+eventTitle+'"></div>');
							}
							multidaylist();
						}

						// If event is multi day, starts in prev month, and ends in current month
					} else if ((endMonth == setMonth && endYear == setYear) && ((startMonth < setMonth && startYear == setYear) || (startYear < setYear))) {
						for(var i = 0; i <= parseInt(endDay); i++) {
							// If first day, add title
							if (i==1){
								$('#'+uniqueId+' *[data-number="'+i+'"] .monthly-indicator-wrap').append('<div class="monthly-event-indicator" data-eventid="'+ eventId +'" style="background:'+eventColor+'" title="'+eventTitle+'">'+eventTitle+'</div>');
							} else {
								$('#'+uniqueId+' *[data-number="'+i+'"] .monthly-indicator-wrap').append('<div class="monthly-event-indicator" data-eventid="'+ eventId +'" style="background:'+eventColor+'" title="'+eventTitle+'"></div>');
							}
							multidaylist();
						}

						// If event is multi day, starts in this month, but ends in next
					} else if ((startMonth == setMonth && startYear == setYear) && ((endMonth > setMonth && endYear == setYear) || (endYear > setYear))){
						for(var i = parseInt(startDay); i <= dayQty; i++) {
							// If first day, add title
							if (i == parseInt(startDay)) {
								$('#'+uniqueId+' *[data-number="'+i+'"] .monthly-indicator-wrap').append('<div class="monthly-event-indicator" data-eventid="'+ eventId +'" style="background:'+eventColor+'" title="'+eventTitle+'">'+eventTitle+'</div>');
							} else {
								$('#'+uniqueId+' *[data-number="'+i+'"] .monthly-indicator-wrap').append('<div class="monthly-event-indicator" data-eventid="'+ eventId +'" style="background:'+eventColor+'" title="'+eventTitle+'"></div>');
							}
							multidaylist();
						}

						// If event is multi day, starts in a prev month, ends in a future month
					} else if (((startMonth < setMonth && startYear == setYear) || (startYear < setYear)) && ((endMonth > setMonth && endYear == setYear) || (endYear > setYear))){
						for(var i = 0; i <= dayQty; i++) {
							// If first day, add title
							if (i == 1){
								$('#'+uniqueId+' *[data-number="'+i+'"] .monthly-indicator-wrap').append('<div class="monthly-event-indicator" data-eventid="'+ eventId +'" style="background:'+eventColor+'" title="'+eventTitle+'">'+eventTitle+'</div>');
							} else {
								$('#'+uniqueId+' *[data-number="'+i+'"] .monthly-indicator-wrap').append('<div class="monthly-event-indicator" data-eventid="'+ eventId +'" style="background:'+eventColor+'" title="'+eventTitle+'"></div>');
							}
							multidaylist();
						}

					}
									
				};
				$(document).bind('click', function(){
					$('.monthly-event-indicator').remove();
					$('.listed-event').remove();
					$('.planLine').remove();
					var json = null;
					json = JSON.parse($('#jsonContainer').text());
					//alert(json.monthly[0].name);
					$.each(json.monthly, function(i, json){
						addEvents(json);						
					});
					
				});
			}
			var divs = $("#"+uniqueId+" .m-d");
			for(var i = 0; i < divs.length; i+=7) {
			  divs.slice(i, i+7).wrapAll("<div class='monthly-week'></div>");
			}
		}

		// Set the calendar the first time
		setMonthly(currentMonth, currentYear);

		// Function to go back to the month view
		function viewToggleButton(){
			if($('#'+uniqueId+' .monthly-event-list').is(":visible")) {
				$('#'+uniqueId+' .monthly-cal').remove();
				$('#'+uniqueId+' .monthly-header-title').prepend('<a href="#" class="monthly-cal" title="Back To Month View">☷ MONTH</a>');
			}
		}

		// Advance months
		$(document.body).on('click', '#'+uniqueId+' .monthly-next', function (e) {
			var setMonth = $('#' + uniqueId).data('setMonth'),
				setYear = $('#' + uniqueId).data('setYear');
			if (setMonth == 12) {
				var newMonth = 1,
					newYear = setYear + 1;
				setMonthly(newMonth, newYear);
			} else {
				var newMonth = setMonth + 1,
					newYear = setYear;
				setMonthly(newMonth, newYear);
			}
			viewToggleButton();
			e.preventDefault();
		});

		// Go back in months
		$(document.body).on('click', '#'+uniqueId+' .monthly-prev', function (e) {
			var setMonth = $('#' + uniqueId).data('setMonth'),
				setYear = $('#' + uniqueId).data('setYear');
			if (setMonth == 1) {
				var newMonth = 12,
					newYear = setYear - 1;
				setMonthly(newMonth, newYear);
			} else {
				var newMonth = setMonth - 1,
					newYear = setYear;
				setMonthly(newMonth, newYear);
			}
			viewToggleButton();
			e.preventDefault();
		});

		// Reset Month
		$(document.body).on('click', '#'+uniqueId+' .monthly-reset', function (e) {
			$(this).remove();
			setMonthly(currentMonth, currentYear);
			viewToggleButton();
			e.preventDefault();
			e.stopPropagation();
		});

		// Back to month view
		$(document.body).on('click', '#'+uniqueId+' .monthly-cal', function (e) {
			$(this).remove();
				$('#' + uniqueId+' .monthly-event-list').css('transform','scale(0)');
				setTimeout(function(){
					$('#' + uniqueId+' .monthly-event-list').hide();
				}, 250);
			e.preventDefault();
		});

		// Click A Day
		$(document.body).on('click', '#'+uniqueId+' a.monthly-day', function (e) {
			// If events, show events list
			if(options.mode == 'event' && options.eventList == true) {
				var whichDay = $(this).data('number');
				$('#' + uniqueId+' .monthly-event-list').show().animate({"left":"600px"},150);
				$('#' + uniqueId+' .monthly-event-list').css('transform');
				$('#' + uniqueId+' .monthly-event-list').css('transform','scale(1)');
				$('#'+uniqueId+' .monthly-list-item[data-number="'+whichDay+'"]').show();
				var myElement = document.getElementById(uniqueId+'day'+whichDay);
				var topPos = myElement.offsetTop;
				//document.getElementByClassname('scrolling_div').scrollTop = topPos;
				$('#'+uniqueId+' .monthly-event-list').scrollTop(topPos);
				viewToggleButton();
			// If picker, pick date
			} else if (options.mode == 'picker') {
				var whichDay = $(this).data('number'),
				setMonth = $('#' + uniqueId).data('setMonth'),
				setYear = $('#' + uniqueId).data('setYear');

				// Should days in the past be disabled?
				if($(this).hasClass('monthly-past-day') && options.disablePast == true) {
					// If so, don't do anything.
					e.preventDefault();
				} else {
					// Otherwise, select the date ...
					$(''+options.target+'').val(setMonth+'/'+whichDay+'/'+setYear);
					// ... and then hide the calendar if it started that way
					if(options.startHidden == true) {
						$('#'+uniqueId).hide();
					}
				}
			}
			e.preventDefault();
		});
		
		var cityNameArray = [];
		var cityRouteMemoIndex = 0;
		// Clicking an event within the list
		$(document.body).on('click', '#'+uniqueId+' .listed-event', function (e) {
			var href = $(this).attr('href');
			// If there isn't a link, don't go anywhere
			var i = $('.listed-event').index(this);
			var evenId = $(this).attr('data-eventid');
			//alert(evenId);
			//alert(i);
			$(this).find('button').attr('data-target','#planMemo'+evenId+'');
			//alert($(this).find('button').attr('data-target'));			
			
			var cityName = $(this).attr('title');
			/*cityNameArray[i] = cityName;
			if(i >= 1) {
				if(cityNameArray[i] != cityNameArray[i-1]) {
					cityRouteMemoIndex++;
				}
			}*/
			
			if(!href) {
				var modalHtml = '<div class="modal fade" id="planMemo'+evenId+'" role="dialog">'+
								    '<div class="modal-dialog">'+
								      '<div class="modal-content">'+
								       '<div class="modal-header">'+
								          '<button type="button" class="close" data-dismiss="modal">&times;</button>'+
								          '<h4 class="modal-title">메모입력</h4>'+
								        '</div>'+
								        '<div class="modal-body">'+
								          '<input type="hidden" name="cityRouteMemoIndex" value="'+Number(evenId)+'"/>'+
								          '<textarea cols="77" rows="3" name="cityRouteMemo"></textarea>'+
								        '</div>'+
								        '<div class="modal-footer">'+
								          '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'+
								       '</div>'+
								      '</div>'+					      
								    '</div>'+
								 '</div>';
				$('#mainPlanSubmit').append(modalHtml);
				/*var fullRoute = $(this).find('span').text(),
					routeArr = fullRoute.split(',');
				
				$(routeArr).each(function(i){
					alert(routeArr[i]);				
				})*/
			
				e.preventDefault();
				
			}
			
		});

		}
	});
})(jQuery);
