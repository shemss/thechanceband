#= require vendor/jquery-1.11.1
#= require vendor/jquery.cookie

if /^en|ru$/.test($.cookie('locale'))
  location.href = "#{baseurl}/#{$.cookie('locale')}/"
else
  location.href = "#{baseurl}/en/"
