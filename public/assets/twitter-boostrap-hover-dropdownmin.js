/*
 * Project: Twitter Bootstrap Hover Dropdown
 * Author: Cameron Spear
 * Contributors: Mattia Larentis
 *
 * Dependencies?: Twitter Bootstrap's Dropdown plugin
 *
 * A simple plugin to enable twitter bootstrap dropdowns to active on hover and provide a nice user experience.
 *
 * No license, do what you want. I'd love credit or a shoutout, though.
 *
 * http://cameronspear.com/blog/twitter-bootstrap-dropdown-on-hover-plugin/
 */(function(e,t,n){var r=e();e.fn.dropdownHover=function(n){r=r.add(this.parent());return this.each(function(){var i=e(this).parent(),s={delay:500,instantlyCloseOthers:!0},o={delay:e(this).data("delay"),instantlyCloseOthers:e(this).data("close-others")},u=e.extend(!0,{},s,n,o),a;i.hover(function(){u.instantlyCloseOthers===!0&&r.removeClass("open");t.clearTimeout(a);e(this).addClass("open")},function(){a=t.setTimeout(function(){i.removeClass("open")},u.delay)})})};e(document).ready(function(){e('[data-hover="dropdown"]').dropdownHover()})})(jQuery,this);