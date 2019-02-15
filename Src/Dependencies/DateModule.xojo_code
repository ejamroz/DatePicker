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


	#tag Note, Name = Version
		Version: 3.1.0
		
		
		
	#tag EndNote


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
