
(function($, window, document, ua) {

    'use strict';

    $.datePickr = function(options) {

        var setting = {
            shortDate: false,
            appendAfter: true
        };

        var opts = $.extend(setting, options);

        var dateMonths = new Array('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'),
            weekDay = new Array('S', 'M', 'T', 'W', 'T', 'F', 'S');

        var date = new Date(),
            dateToday = date,
            dateSplit = "-";

        var add0 = function(x) {
            return ((x < 10) ? "0" + x : x);
        };

        var textDate = function(d, m, y, whatday) {
            var td = new Date(y, m - 1, d),
                result;
            if (whatday === true) {
                result = (td.getFullYear() + "-" + dateMonths[td.getMonth()] + "-" + add0(td.getDate()) + " (" + weekDay[td.getDay()] + ")");
            } else {
                result = (td.getFullYear() + "-" + dateMonths[td.getMonth()] + "-" + add0(td.getDate()));
            }
            return result;
        };

        var toShortDate = function(d) {
            var result;
            d = new Date(d);
            result = (add0(d.getDate()) + dateSplit + add0(d.getMonth() + 1) + dateSplit + d.getFullYear());
            return result;
        };

        var writeInputDateValue = function(_el, _input) {
            var d = _el.data("day");
            if (opts.shortDate === true) d = toShortDate(d);
            _input.val(d);
        };

        var buildCalendar = function(date, _input) {

            var day = date.getDate(),
                month = date.getMonth(),
                year = date.getFullYear(),
                thisMonth = new Date(year, month, 1),
                nextMonth = new Date(year, month + 1, 1),
                firstWeekDay = thisMonth.getDay(),
                daysInMonth = Math.floor((nextMonth.getTime() - thisMonth.getTime()) / (1000 * 60 * 60 * 24));

            var _isOver = false,
                _html = '';

            var _minDay = [],
                _maxDay = [];

            if (_input.data('min')) _minDay = _input.data('min').split('-', 3); // ?????? ?????? ??????
            if (_input.data('max')) _maxDay = _input.data('max').split('-', 3); // ?????? ?????? ??????

            if (month == 2) daysInMonth = 31;

            _html += '<div class="cal-wrapper">';
            _html += '<div class="head">';
            _html += '<div class="year"><select title="?????? ??????" class="select">';

            for (var y = 2020; y < 2030; y++) {
                if (y == year) {
                    _html += '<option value="' + y + '" selected>' + y + '</option>';
                } else {
                    _html += '<option value="' + y + '">' + y + '</option>';
                }
            }

            _html += '</select><a href="javascript:;" class="btn"><span class="sr-only">????????? ?????????</span><span>Move</span></a></div>';
            _html += '<div class="month">';

            if ((year < _minDay[0]) || (year == _minDay[0] && dateMonths[month] <= _minDay[1])) {
                _html += '<a href="javascript:;" class="nav prevmonth disabled"><span class="ir"><em>?????? ' + dateMonths[(month === 0) ? 11 : month - 1] + ' ?????? ??????</em></span></a>';
            } else {
                _html += '<a href="javascript:;" class="nav prevmonth"><span class="ir"><em>?????? ' + dateMonths[(month === 0) ? 11 : month - 1] + ' ?????? ??????</em></span></a>';
            }

            _html += '<span class="month"><strong>' + dateMonths[month] + '</strong>Month<span class="sr-only"> - ?????? ???</span></span>';

            if ((year > _maxDay[0]) || (year == _maxDay[0] && dateMonths[month] >= _maxDay[1])) {
                _html += '<a href="javascript:;" class="nav nextmonth disabled"><span class="ir"><em>?????? ' + dateMonths[(month == 11) ? 0 : month + 1] + ' ?????? ??????</em></span></a>';
            } else {
                _html += '<a href="javascript:;" class="nav nextmonth"><span class="ir"><em>?????? ' + dateMonths[(month == 11) ? 0 : month + 1] + ' ?????? ??????</em></span></a>';
            }

            _html += '</div>';
            _html += '<div class="today"><a href="javascript:;" class="today" data-day=' + textDate(dateToday.getDate(), dateToday.getMonth() + 1, dateToday.getFullYear(), false) + '>Today: <span>' + textDate(dateToday.getDate(), dateToday.getMonth() + 1, dateToday.getFullYear(), true) + '</span><span class="sr-only"> - ?????? ???/?????? ??????</span></a></div>';
            _html += '</div>';
            _html += '<div class="core">';
            _html += '<table class="calendar" cellspacing="0" summary="?????? ????????? ?????? ???????????? ??????????????????.">';
            _html += '<caption>?????? ??????</caption>';
            _html += '<thead><tr><th scope="col" class="weekend sun"><abbr title="?????????">S</abbr></th><th scope="col" class="mon"><abbr title="?????????">M</abbr></th><th scope="col" class="tue"><abbr title="?????????">T</abbr></th><th scope="col" class="wed"><abbr title="?????????">W</abbr></th><th scope="col" class="thu"><abbr title="?????????">T</abbr></th><th scope="col" class="fri"><abbr title="?????????">F</abbr></th><th scope="col" class="weekend sat"><abbr title="?????????">S</abbr></th></tr></thead>';
            _html += '<tbody>';
            _html += '<tr>';

            for (var week = 0; week < firstWeekDay; week++) {
                if (week === 0) {
                    _html += '<td class="empty weekend sun">&nbsp;</td>';
                } else if (week == 6) {
                    _html += '<td class="empty weekend sat">&nbsp;</td>';
                } else {
                    _html += '<td class="empty">&nbsp;</td>';
                }
            }

            var mm = nextMonth.getMonth();
            if (mm < 1) mm = 12;
            mm = add0(mm);
            var week_day = firstWeekDay;

            for (var dayCounter = 1; dayCounter <= daysInMonth; dayCounter++) {
                week_day %= 7;
                if (week_day === 0) _html += '</tr>';
                if (week_day === 0) {
                    _html += '<td class="weekend sun">';
                } else if (week_day == 6) {
                    _html += '<td class="weekend sat">';
                } else {
                    _html += '<td>';
                }
                if ((year < _minDay[0]) || (year == _minDay[0] && dateMonths[month] < _minDay[1]) || (year == _minDay[0] && dateMonths[month] == _minDay[1] && dayCounter < _minDay[2])) {
                    _isOver = true;
                    _html += '<span title="' + textDate(dayCounter, mm, year, true) + '">' + add0(dayCounter) + '</span></td>';
                } else if ((year > _maxDay[0]) || (year == _maxDay[0] && dateMonths[month] > _maxDay[1]) || (year == _maxDay[0] && dateMonths[month] == _maxDay[1] && dayCounter > _maxDay[2])) {
                    _isOver = true;
                    _html += '<span title="' + textDate(dayCounter, mm, year, true) + '">' + add0(dayCounter) + '</span></td>';
                } else {
                    _isOver = false;
                    _html += '<a title="' + textDate(dayCounter, mm, year, true) + '" data-day="' + textDate(dayCounter, mm, year, false) + '" href="' + dayCounter + '">' + add0(dayCounter) + '</a></td>';
                }
                week_day++;
            }

            for (week_day = week_day; week_day < 7; week_day++) { // ??? ??? ?????????
                if (week_day === 0) {
                    _html += '<td class="empty weekend sun">&nbsp;</td>';
                } else if (week_day == 6) {
                    _html += '<td class="empty weekend sat">&nbsp;</td>';
                } else {
                    _html += '<td class="empty">&nbsp;</td>';
                }
            }

            _html += '</tr></tbody></table>';
            _html += '</div>';
            _html += '<a id="skipCalendar" href="#!" class="button-close"><span class="icon close"><em>?????? ????????? (?????? ???) ??????</em></span></a>';
            _html += '</div>';

            return _html;
        };

        var hideCalendar = function(_el, _button) {
            _el.animate({
                opacity: 0
            }, 300, function() {
                $(this).remove();
            });
            _button.focus();
        };

        var displayCalendar = function(_el, _input, _button, _x, _y) {

            _el.empty().append(buildCalendar(date, _input));

            var $buttons = $('table.calendar td a'),
                $buttonYear = $('div.year a'),
                $buttonPrevMonth = $('a.prevmonth'),
                $buttonNextMonth = $('a.nextmonth'),
                $buttonToday = $('div.today a'),
                $buttonClose = $('a.button-close');

            // ?????? ?????????
            $buttons.on('click', _el, function(e) {
                e.preventDefault();
                writeInputDateValue($(this), _input);
                hideCalendar(_el, _button);
                return false;
            });

            $buttonYear.on('click', _el, function(e) {
                e.preventDefault();
                var _year = $(this).prev().val();
                date = new Date(_year, date.getMonth(), 1);
                displayCalendar(_el, _input, _button);
                $('div.year select', _el).focus();
            });

            // ?????? ???
            $buttonPrevMonth.on('click', _el, function(e) {
                e.preventDefault();
                var $this = $(this);
                if ($this.hasClass('disabled')) {
                    alert(_input.data('min') + ' You cannot select a month beyond.');
                } else {
                    date = new Date(date.getFullYear(), date.getMonth() - 1, 1);
                    displayCalendar(_el, _input, _button);
                }
                $this.focus();
            });

            // ?????? ???
            $buttonNextMonth.on('click', _el, function(e) {
                e.preventDefault();
                var $this = $(this);
                if ($this.hasClass('disabled')) {
                    alert(_input.data('max') + ' You cannot select a month beyond.');
                } else {
                    date = new Date(date.getFullYear(), date.getMonth() + 1, 1);
                    displayCalendar(_el, _input, _button);
                }
                $this.focus();
            });

            // ??????
            $buttonClose.on('click', _el, function(e) {
                e.preventDefault();
                hideCalendar(_el, _button);
                _button.focus();
            });

            // ?????? ??????
            $buttonToday.on('click', _el, function(e) {
                e.preventDefault();
                date = new Date();
                displayCalendar(_el, _input, _button);
                _el.find('a.today').focus();
            });

            // today highlighting
            $buttons.each(function() {
                var $this = $(this);
                var _today = $('div.today a.today', _el).data('day');
                if ($this.data('day') == _today) $this.attr('title', $this.attr('title') + ' (??????)').addClass('today');
            });

            // ?????? ??????
            var getPos = (function() {
                var _pos;

                if (_button.parent().css('position') == 'relative') {
                    _pos = _button.position();
                    _x = _pos.left;
                    _y = _pos.top + 30;
                } else {
                    _x -= 20;
                    _y += 20;
                    _y += $(window).scrollTop(); // ????????? ???
                }

                _el.css({
                    left: _x,
                    top: _y,
                    opacity: 1
                }).find('select').focus();
            }());

            return false;
        };

        var base = [];

        var _focusOut = function() {
            var regExp = /^([0-9]{4})-([0-9]{2})-([0-9]{2})/g;
            var _val = $(this).val();
            if (_val !== '' && !regExp.test(_val)) {
                alert('Enter date in the correct format.\n E.g. 2013-11-11');
                setTimeout(function() {
                    $(this).val('').focus();
                }, 100);
            }
        };

        var _click = function(e) {
            e.preventDefault();

            var $this = $(this);

            base.$input = $this.next('input').eq(0);
            base.$calendar = $('<div class="section-datepicker lg"></div>');

            base.$input.attr('maxlength', '10');
            base.$input.on('focusout', _focusOut);

            var regExp = /^([0-9]{4})-([0-9]{2})-([0-9]{2})/g,
                value = base.$input.val(),
                _x = e.clientX,
                _y = e.clientY;

            $('.section-datepicker').remove();

            if (value !== '' && regExp.test(value)) {
                var _t = value.split('-', 4);
                date = new Date(_t[0], _t[1] - 1, _t[2]);
            } else {
                date = new Date();
            }
            if (opts.appendAfter === true) {
                $this.after(base.$calendar);
            } else {
                $('body').append(base.$calendar);
            }

            displayCalendar(base.$calendar, base.$input, $this, _x, _y);
        };

        $(document).off('.datepickr').on('click.datepickr', '.js-datepickr', _click);

    };

})(jQuery, window, document, navigator.userAgent || navigator.vendor || window.opera);


