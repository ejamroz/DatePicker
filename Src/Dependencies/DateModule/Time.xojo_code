#tag Class
Protected Class Time
	#tag Method, Flags = &h21
		Private Sub constructFromFormat12(tt as string)
		  //@throws: DateModule.InvalidArgumentException
		  //PRE: tt is in form 00:00 AM/PM
		  
		  
		  dim meridian as integer
		  if Instr(tt, "PM") > 0 then
		    meridian = 12
		    
		  end if
		  
		  tt = ReplaceAll(tt, " ", "")
		  tt = ReplaceAll(tt, "AM", "")
		  tt = ReplaceAll(tt, "PM", "")
		  
		  dim values() as string = tt.Split(":")
		  values(0) = str(val(values(0)) + meridian)
		  try
		    validateHour(val(values(0)))
		    validateMinute(val(values(1)))
		    self.mHour = val(values(0))
		    self.mMinute = val(values(1))
		    
		  catch err as DateModule.InvalidArgumentException
		    raise err
		    
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub constructFromFormat24(tt as string)
		  //@throws: DateModule.InvalidArgumentException
		  //PRE: tt is in format 00:00:00
		  //POST: all secods will be lost 
		  
		  dim values() as string = tt.Split(":")
		  
		  try
		    validateHour(val(values(0)))
		    validateMinute(val(values(1)))
		    self.mHour = val(values(0))
		    self.mMinute = val(values(1))
		    
		  catch err as DateModule.InvalidArgumentException
		    raise err
		    
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(hour as integer, minute as integer)
		  //@throws: DateModule.InvalidArgumentException
		  
		  try
		    validateHour(hour)
		    validateMinute(minute)
		    self.mHour = hour
		    self.mMinute = minute
		    
		  catch err as DateModule.InvalidArgumentException
		    raise err
		    
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(tt as string)
		  //@throws: DateModule.InvalidArgumentException
		  
		  select case getTimeFormat(tt)
		  case kFormat12
		    try
		      constructFromFormat12(tt)
		      
		    catch err as DateModule.InvalidArgumentException
		      raise err
		      
		    end try
		    
		  case kFormat24
		    try 
		      constructFromFormat24(tt)
		      
		    Catch err as DateModule.InvalidArgumentException
		      raise err
		      
		    end try
		    
		  case kFormatUnknown
		    dim err as new DateModule.InvalidArgumentException()
		    err.Reason = "Invalid time value passed"
		    
		    raise err
		    
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(hour as string, minute as string)
		  //@throws: DateModule.InvalidArgumentException
		  
		  try
		    validateHour(val(hour))
		    validateMinute(val(minute))
		    self.mHour = val(hour)
		    self.mMinute = val(minute)
		    
		  catch err as DateModule.InvalidArgumentException
		    raise err
		    
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getTimeFormat(tt as String) As integer
		  dim rg as new RegEx()
		  dim match as RegExMatch
		  rg.SearchPattern = kSearchPattern_12
		  match = rg.Search(tt)
		  if match <> Nil then
		    return kFormat12
		    
		  else
		    rg.SearchPattern = kSearchPattern_24
		    match = rg.Search(tt)
		    if match <> Nil then
		      return kFormat24
		      
		    end if
		    
		  end if
		  
		  return kFormatUnknown
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub validateHour(hour as integer)
		  //@throws: DateModule.InvalidArgumentException
		  
		  if hour < 0 or hour > 24 then 
		    dim err as new DateModule.InvalidArgumentException()
		    err.Reason = "Invalid hour time passed"
		    
		    raise err
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub validateMinute(minute as integer)
		  //@throws: DateModule.InvalidArgumentException
		  
		  if minute < 0 or minute > 59 then 
		    dim err as new DateModule.InvalidArgumentException()
		    err.Reason = "Invalid minute time passed"
		    
		    raise err
		    
		  end if
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  select case mHour
			  case 0
			    return "12:" + Format(minute, "00") + " AM"
			    
			  case is < 12
			    return str(mHour) + ":" + Format(minute, "00") + " AM"
			    
			  case 12
			    return "12:" + Format(minute, "00") + " PM"
			    
			  else
			    return str(mHour - 12) + ":" + Format(minute, "00") + " PM"
			    
			  end Select
			  
			End Get
		#tag EndGetter
		format_12Hour As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Format(mHour, "00") + ":" + Format(minute, "00") + ":00"
			End Get
		#tag EndGetter
		format_SQL As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mHour
			  
			End Get
		#tag EndGetter
		hour As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mHour As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMinute
			  
			End Get
		#tag EndGetter
		minute As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMinute As integer
	#tag EndProperty


	#tag Constant, Name = kFormat12, Type = Double, Dynamic = False, Default = \"12", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFormat24, Type = Double, Dynamic = False, Default = \"24", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFormatUnknown, Type = Double, Dynamic = False, Default = \"-1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSearchPattern_12, Type = String, Dynamic = False, Default = \"^((1[012]|[1-9]):[0-9]{2}\\s*AM|(1[012]|[1-9]):[0-9]{2}\\s*PM)$", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSearchPattern_24, Type = String, Dynamic = False, Default = \"^[0-9]{2}:[0-9]{2}:[0-9]{2}$", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="hour"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="format_12Hour"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
			Name="format_SQL"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="minute"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
