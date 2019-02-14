#tag Module
Protected Module DateModule
	#tag Method, Flags = &h0
		Function checkIfIsLeapYear(year as integer) As boolean
		  if year mod 4 = 0 then
		    if year mod 100 = 0 then 
		      if year mod 400 = 0 then 
		        return true
		        
		      end if 
		      
		    else
		      return true
		      
		    end if
		    
		  end if 
		  
		  return false 
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function checkIfIsLeapYear(dd as Xojo.Core.Date) As boolean
		  return checkIfIsLeapYear(dd.Year)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function compareTo(extends left as Xojo.Core.Date, right as Xojo.Core.Date) As integer
		  //XXX: ONLY COMPARES YEAR, MONTH, AND DAY
		  
		  dim d1 as integer = val(datetoworddate(left))
		  dim d2 as integer = val(datetoworddate(right))
		  
		  if d1 > d2 then 
		    return 1
		    
		  ElseIf d1 < d2 then
		    Return -1
		    
		  else
		    return 0
		    
		  end if
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function convertTotalSecondsToNumDaysTruncated(totalSeconds as Double) As integer
		  //Rounds down
		  
		  if totalSeconds >= 0 then 
		    return totalSeconds \ 86400
		    
		  end if
		  
		  return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function dateDiff(sDate as Date, eDate as Date) As integer
		  dim diffInSeconds as double = eDate.TotalSeconds - sdate.TotalSeconds
		  if diffInSeconds < 0 then
		    diffInSeconds = -1 * diffInSeconds
		    
		  end if
		  
		  return convertTotalSecondsToNumDaysTruncated(diffInSeconds)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function dateDiff(sDate as Xojo.Core.Date, eDate as Xojo.Core.Date) As integer
		  dim diffInSeconds as double = eDate.SecondsFrom1970 - sdate.SecondsFrom1970
		  if diffInSeconds < 0 then
		    diffInSeconds = -1 * diffInSeconds
		    
		  end if
		  
		  return convertTotalSecondsToNumDaysTruncated(diffInSeconds)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function dateto6figures(indate as date) As String
		  dim s as string
		  
		  return format(indate.month,"00") + "/" + format(indate.day,"00") + "/" + right(str(indate.year),2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function datetodayofweek(dd as date) As String
		  select case dd.DayOfWeek
		  case 1
		    return kSunday
		    
		  case 2
		    return kMonday
		    
		  case 3
		    return kTuesday
		    
		  case 4
		    return kWednesday
		    
		  case 5
		    Return kThursday
		    
		  case 6
		    Return kFriday
		    
		  case 7
		    return kSaturday
		    
		  end select
		  
		  return ""
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function datetohrdate(indate as date) As String
		  dim d as date
		  d = indate
		  return format(d.month,"00") + "/" + format (d.day,"00") + "/" + str(d.year)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function datetomonthname(indate as date) As String
		  if indate.month = 1 then
		    return "January"
		  elseif indate.month = 2 then
		    return "February"
		  elseif indate.month = 3 then
		    return "March"
		  elseif indate.month = 4 then
		    return "April"
		  elseif indate.month = 5 then
		    return "May"
		  elseif indate.month = 6 then
		    return "June"
		  elseif indate.month = 7 then
		    return "July"
		  elseif indate.month = 8 then
		    return "August"
		  elseif indate.month = 9 then
		    return "September"
		  elseif indate.month = 10 then
		    return "October"
		  elseif indate.month = 11 then
		    return "November"
		  elseif indate.month = 12 then
		    return "December"
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function datetonumberdate(d as date) As integer
		  dim worddate as string
		  
		  worddate = str(d.year) + format(d.month,"00") + format (d.day,"00")
		  return val(worddate)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function datetoshortdate(dd as date) As String
		  if dd <> Nil then 
		    return format(dd.month,"00") + "/" + format (dd.day,"00") + "/" + right(str(dd.year),2)
		    
		  end if
		  
		  return "" 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function datetoshortdate(dd as Xojo.Core.Date) As String
		  if dd <> Nil then 
		    return format(dd.month,"00") + "/" + format (dd.day,"00") + "/" + right(str(dd.year),2)
		    
		  end if
		  
		  return "" 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function dateToSixFirgureDate(dd as Date) As string
		  if dd <> NIl then
		    dim wordDate as string = datetoworddate(dd)
		    
		    return mid(wordDate,5,2) + right(wordDate,2) + mid(wordDate,3,2)
		    
		  end if
		  
		  return "" 
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function dateToSixFirgureDate(dd as Xojo.Core.Date) As string
		  if dd <> Nil then
		    dim wordDate as string = datetoworddate(dd)
		    
		    return mid(wordDate,5,2) + right(wordDate,2) + mid(wordDate,3,2)
		    
		  end if
		  
		  return "" 
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function dateToSqlDate(dd as Xojo.Core.Date) As string
		  return str(dd.Year) + "-" + Format(dd.Month, "00") + "-" + Format(dd.Day, "00")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function datetoworddate(dd as date) As String
		  if dd <> Nil then
		    return str(dd.year) + format(dd.month,"00") + format(dd.day,"00")
		    
		  end if
		  
		  return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function datetoworddate(dd as Xojo.Core.Date) As String
		  if dd <> Nil then 
		    return str(dd.year) + format(dd.month,"00") + format(dd.day,"00")
		    
		  end if
		  
		  return "" 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getDateRange(sDate as string, eDate as String) As string()
		  try
		    validateDate(sDate)
		    validateDate(eDate)
		    
		  catch err as DateModule.InvalidArgumentException
		    raise err
		    
		  end try
		  
		  dim retValues() as string
		  dim currentDay as string = sDate
		  while val(currentDay) <= val(eDate)
		    retValues.Append(currentDay)
		    currentDay = getNextDay(currentDay)
		    
		  wend
		  
		  return retValues
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getlastday(inmonth as integer, inyear as integer) As Integer
		  
		  if inmonth = 1 then
		    return 31
		  elseif inmonth = 2 then
		    if inyear mod 4 = 0 then 'leap year
		      return 29
		    else
		      return 28
		    end if
		  elseif inmonth = 3 then
		    return 31
		  elseif inmonth = 4 then
		    return 30
		  elseif inmonth = 5 then
		    return 31
		  elseif inmonth =6 then
		    return 30
		  elseif inmonth =7 then
		    return 31
		  elseif inmonth =8 then
		    return 31
		  elseif inmonth =9 then
		    return 30
		  elseif inmonth = 10 then
		    return 31
		  elseif inmonth = 11 then
		    return 30
		  elseif inmonth = 12 then
		    return 31
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getNextDay(theDate as String) As string
		  try
		    validateDate(theDate)
		    
		  catch err as DateModule.InvalidArgumentException
		    #Pragma BreakOnExceptions false
		    raise err
		    #Pragma BreakOnExceptions true
		    
		  end try
		  
		  dim day as integer = val(right(theDate, 2))
		  dim month as integer = val(mid(theDate, 5, 2))
		  dim year as integer = val(left(theDate, 4))
		  
		  if day < getNumberOfDaysInMonth(theDate) then 
		    day = day + 1
		    
		  else
		    day = 1
		    if month < 12 then 
		      month = month + 1
		      
		    else
		      year = year + 1
		      month = 1
		      
		    end if
		    
		  end if
		  
		  return str(year) + Format(month, "0#") + Format(day, "0#")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getNumberOfDaysInMonth(theDate as string) As integer
		  try 
		    validateDate(theDate)
		    
		  catch err as DateModule.InvalidArgumentException
		    #Pragma BreakOnExceptions false
		    raise err
		    #Pragma BreakOnExceptions true
		    
		  end try
		  
		  dim year as string = left(theDate, 4)
		  dim month as string = mid(theDate, 5, 2)
		  dim day as string = right(theDate, 2)
		  
		  select case val(month)
		  case 1,3,5,7,8,10,12
		    return 31
		    
		  case 4,6,9,11
		    return 30
		    
		  case 2
		    if not checkIfIsLeapYear(val(year)) then 
		      return 28
		      
		    else
		      return 29 
		      
		    end if
		    
		  end select
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getNumberOfDaysInMonth(theDate as Xojo.Core.Date) As integer
		  select case theDate.month
		  case 1,3,5,7,8,10,12
		    return 31
		    
		  case 4,6,9,11
		    return 30
		    
		  case 2
		    if not checkIfIsLeapYear(theDate.year) then 
		      return 28
		      
		    else
		      return 29 
		      
		    end if
		    
		  end select
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getTimeLeftInDate(extends dd as Xojo.Core.Date) As Xojo.Core.DateInterval
		  dim lastMoment as new Xojo.Core.Date(dd.Year, dd.Month, dd.Day, 23, 59, 59, 0, Xojo.Core.TimeZone.Current)
		  
		  return lastMoment - dd
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hrdatetoworddate(hrdate as string) As String
		  return right(hrdate,4) + left(hrdate,2) + mid(hrdate,4,2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function integertodayname(dayOfWeek as integer) As string
		  //@throws: DateModule.InvalidArgumentException
		  
		  select case dayOfWeek
		  case 1
		    return kSunday
		    
		  case 2
		    return kMonday
		    
		  case 3
		    return kTuesday
		    
		  case 4
		    return kWednesday
		    
		  case 5
		    return kThursday
		    
		  case 6
		    return kFriday
		    
		  case 7
		    return kSaturday
		    
		  end Select
		  
		  #Pragma BreakOnExceptions false
		  dim err as DateModule.InvalidArgumentException
		  err.Reason = "Unknown day of week passed"
		  
		  raise err
		  #Pragma BreakOnExceptions true 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function integerToMonth(ii as Integer) As Text
		  //@throws: DateModule.InvalidArgumentException
		  
		  select case ii
		  case 1
		    return kJanuary
		    
		  case 2 
		    return kFebruary
		    
		  case 3 
		    return kMarch
		    
		  case 4 
		    return kApril
		    
		  case 5 
		    return kMay
		    
		  case 6 
		    return kJune
		    
		  case 7 
		    return kJuly
		    
		  case 8 
		    return kAugust
		    
		  case 9 
		    return kSeptember
		    
		  case 10 
		    return kOctober
		    
		  case 11 
		    return kNovember
		    
		  case 12 
		    return kDecember
		    
		  end select
		  
		  #Pragma BreakOnExceptions false
		  dim err as new DateModule.InvalidArgumentException()
		  err.Reason = "Unknown month number passed"
		  
		  raise err
		  #Pragma BreakOnExceptions true 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function monthdaytoenglish(n as integer) As string
		  if n = 1 or n = 21 or n = 31 then
		    return str(n) + "st"
		  elseif n = 2 or n = 22 then
		    return str(n) + "nd"
		  elseif n = 3 or n = 23 then
		    return str(n) + "rd"
		  elseif n >= 4 and n <= 20 then
		    return str(n) + "th"
		  elseif n >= 24 and n <= 30 then
		    return str(n) + "th"
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function shortdatetoworddate(inshortdate as string) As String
		  
		  if len(inshortdate) = 8 then
		    if val(right(inshortdate,2)) > 50 then
		      return "19" + right(inshortdate,2) + left(inshortdate,2) + mid(inshortdate,4,2)
		    else
		      return "20" + right(inshortdate,2) + left(inshortdate,2) + mid(inshortdate,4,2)
		    end if
		  elseif len(inshortdate) = 10 then
		    if val(right(inshortdate,2)) > 50 then
		      return "19" + right(inshortdate,2) + left(inshortdate,2) + mid(inshortdate,4,2)
		    else
		      return "20" + right(inshortdate,2) + left(inshortdate,2) + mid(inshortdate,4,2)
		    end if
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeStampToDateAndTime(TimeStampString as string) As string
		  dim prefix,suffix,s,year,month,day,hour,minute,second,ampm as string
		  
		  prefix = NthField(TimeStampString," ",1)
		  suffix = NthField(TimeStampString," ",2)
		  
		  year = NthField(prefix,"-",1)
		  month = NthField(prefix,"-",2)
		  day = NthField(prefix,"-",3)
		  
		  hour = NthField(suffix,":",1)
		  minute = NthField(suffix,":",2)
		  second = NthField(suffix,":",3)
		  
		  if val(hour) > 12 then
		    hour = str(val(hour) - 12)
		    ampm = "PM"
		  else
		    ampm = "ZM"
		  end if
		  
		  return month + "/" + day + "/" + year + "      " + hour + ":" + minute + ":" + second + " " + ampm
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toCoreDate(extends classicDate as date) As Xojo.Core.Date
		  return new Xojo.Core.Date(_
		  classicDate.year,_
		  classicDate.Month,_
		  classicDate.Day,_
		  classicDate.Hour,_
		  classicDate.Minute,_
		  classicDate.Second,_
		  Xojo.Core.TimeZone.Current)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub validateDate(theDate as string)
		  //@Throws: DateModule.InvalidArgumentException
		  
		  if len(theDate) = 8 and IsNumeric(theDate) then
		    dim d as Date
		    dim dateString as string = mid(theDate, 5, 2) + "/" + right(theDate, 2) + "/" + left(theDate, 4) 
		    if ParseDate(dateString, d) then
		      return
		      
		    end if
		    
		  end if
		  
		  #Pragma BreakOnExceptions false 
		  dim err as new DateModule.InvalidArgumentException()
		  err.Reason = "Invalid date passed"
		  err.ErrorNumber = 1
		  raise err
		  #Pragma BreakOnExceptions false 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function wordDatetoCoreDate(worddate as String) As Xojo.Core.Date
		  dim d as new Xojo.Core.Date(val(left(worddate,4)),_
		  val(mid(worddate,5,2)), val(right(worddate,2)),_
		  Xojo.Core.TimeZone.Current)
		  
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function worddatetodate(worddate as String) As date
		  return new date(val(left(worddate,4)), val(mid(worddate,5,2)), val(right(worddate,2)), 0, 0, 0)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function worddatetohrdate(worddate as string) As String
		  
		  if worddate = "" then
		    return ""
		  else
		    return mid(worddate,5,2) + "/" + right(worddate,2) + "/" + left(worddate,4)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function worddatetoshortdate(instring as string) As String
		  
		  if len(instring) = 8 then
		    return mid(instring,5,2) + "/" + right(instring,2) + "/" + mid(instring,3,2)
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function wordDateToSixDigitDate(instring as string) As string
		  dim dd,mm,yy as string
		  
		  dd = right(instring,2)
		  mm = mid(instring,5,2)
		  yy = mid(instring,3,2)
		  
		  return mm + dd + yy
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function wordDateToSqlDate(dd as String) As string
		  try 
		    validateDate(dd)
		    return left(dd, 4) + "-" + mid(dd,5,2) + "-" + Right(dd,2)
		    
		  catch err as DateModule.InvalidArgumentException
		    raise err
		    
		  end try
		End Function
	#tag EndMethod


	#tag Note, Name = Version
		Version: 3.1.0
		
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		todaysdate As date
	#tag EndProperty


	#tag Constant, Name = kApril, Type = Text, Dynamic = False, Default = \"April", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAugust, Type = Text, Dynamic = False, Default = \"August", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDecember, Type = Text, Dynamic = False, Default = \"December", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFebruary, Type = Text, Dynamic = False, Default = \"February", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFriday, Type = Text, Dynamic = False, Default = \"Friday", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kJanuary, Type = Text, Dynamic = False, Default = \"January", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kJuly, Type = Text, Dynamic = False, Default = \"July", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kJune, Type = Text, Dynamic = False, Default = \"June", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMarch, Type = Text, Dynamic = False, Default = \"March", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMay, Type = Text, Dynamic = False, Default = \"May", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMonday, Type = Text, Dynamic = False, Default = \"Monday", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNovember, Type = Text, Dynamic = False, Default = \"November", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOctober, Type = Text, Dynamic = False, Default = \"October", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSaturday, Type = Text, Dynamic = False, Default = \"Saturday", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSeptember, Type = Text, Dynamic = False, Default = \"September", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSunday, Type = Text, Dynamic = False, Default = \"Sunday", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kThursday, Type = Text, Dynamic = False, Default = \"Thursday", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTuesday, Type = Text, Dynamic = False, Default = \"Tuesday", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWednesday, Type = Text, Dynamic = False, Default = \"Wednesday", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
