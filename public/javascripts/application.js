// We want to use the JQuery prefix rather than $ prefix as long as we haven't removed prototype to prevent conflicts.
jQuery.noConflict();

// The ajax stuff was taken from http://www.notgeeklycorrect.com/english/2009/05/18/beginners-guide-to-jquery-ruby-on-rails/

jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

function _ajax_request(url, data, callback, type, method) {
    if (jQuery.isFunction(data)) {
        callback = data;
        data = {};
    }
    return jQuery.ajax({
        type: method,
        url: url,
        data: data,
        success: callback,
        dataType: type
        });
}

jQuery.extend({
    put: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'PUT');
    },
    delete_: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'DELETE');
    }
});


//Send data via get if <acronym title="JavaScript">JS</acronym> enabled
jQuery.fn.getWithAjax = function() {
  this.unbind('click', false);
  this.click(function() {
    jQuery.get(jQuery(this).attr("href"), jQuery(this).serialize(), null, "script");
    return false;
  })
  return this;
};

//Send data via Post if <acronym title="JavaScript">JS</acronym> enabled
jQuery.fn.postWithAjax = function() {
  this.unbind('click', false);
  this.click(function() {
    jQuery.post(jQuery(this).attr("href"), jQuery(this).serialize(), null, "script");
    return false;
  })
  return this;
};

jQuery.fn.putWithAjax = function() {
  this.unbind('click', false);
  this.click(function() {
    jQuery.put(jQuery(this).attr("href"), jQuery(this).serialize(), null, "script");
    return false;
  })
  return this;
};

jQuery.fn.deleteWithAjax = function() {
  this.removeAttr('onclick');
  this.unbind('click', false);
  this.click(function() {
    jQuery.delete_(jQuery(this).attr("href"), jQuery(this).serialize(), null, "script");
    return false;
  })
  return this;
};


jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    jQuery.post(this.action, jQuery(this).serialize(), null, "script");
    return false;
  });
  return this;
};


//This will "ajaxify" the links
function ajaxLinks(){
    jQuery("[id^=ajax_form]").submitWithAjax();
    jQuery('a.get').getWithAjax();
    jQuery('a.post').postWithAjax();
    jQuery('a.put').putWithAjax();
    jQuery('a.delete').deleteWithAjax();
}

jQuery(document).ready(function() {

// All non-GET requests will add the authenticity token
  // if not already present in the data packet
 jQuery(document).ajaxSend(function(event, request, settings) {
       if (typeof(window.AUTH_TOKEN) == "undefined") return;
       // <acronym title="Internet Explorer 6">IE6</acronym> fix for http://dev.jquery.com/ticket/3155
       if (settings.type == 'GET' || settings.type == 'get') return;

       settings.data = settings.data || "";
       settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(window.AUTH_TOKEN);
     });

  ajaxLinks();

  });

