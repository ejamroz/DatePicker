#tag Window
Begin ContainerControl CalendarDay
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   32
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   32
   Begin Rectangle BGLeft
      AutoDeactivate  =   True
      BorderWidth     =   0
      BottomRightColor=   &c00000000
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      Top             =   0
      TopLeftColor    =   &c00000000
      Transparent     =   False
      Visible         =   True
      Width           =   16
   End
   Begin Rectangle BGRight
      AutoDeactivate  =   True
      BorderWidth     =   0
      BottomRightColor=   &c00000000
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   16
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      Top             =   0
      TopLeftColor    =   &c00000000
      Transparent     =   False
      Visible         =   True
      Width           =   16
   End
   Begin Oval Foreground
      AutoDeactivate  =   True
      BorderColor     =   &c00000000
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      Top             =   0
      Transparent     =   False
      Visible         =   True
      Width           =   32
   End
   Begin Label DayLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "00"
      TextAlign       =   1
      TextColor       =   &c00000200
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub activate()
		  isActive = true
		  DayLabel.TextColor = kActiveTextColor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub clearHighlight()
		  BGLeft.FillColor = kBgColor
		  BGRight.FillColor = kBgColor
		  Foreground.FillColor = kBgColor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor()
		  setHighlightColor(&c4286f400)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deactivate()
		  isActive = false
		  clearHighlight()
		  DayLabel.TextColor = kInActiveTextColor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getTint(cc as Color) As color
		  const kTintFactor = .25
		  dim rr,gg,bb as integer 
		  
		  rr = cc.Red + (255 - cc.red) * kTintFactor
		  gg = cc.Green + (255 - cc.Green) * kTintFactor
		  bb = cc.Blue + (255 - cc.Blue) * kTintFactor
		  
		  return RGB(rr, gg, bb)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub highlightEnd()
		  Foreground.FillColor = highlightColor
		  BGLeft.FillColor = highlightTint
		  BGRight.FillColor = kBgColor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub highlightMiddle()
		  Foreground.FillColor = highlightTint
		  BGLeft.FillColor = highlightTint
		  BGRight.FillColor = highlightTint
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub highlightStart()
		  Foreground.FillColor = highlightColor
		  BGRight.FillColor = highlightTint
		  BGLeft.FillColor = kBgColor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub makeInvisible()
		  clearHighlight()
		  BGLeft.Visible = false
		  BGRight.Visible = false
		  Foreground.Visible = False
		  DayLabel.Visible = False
		  deactivate()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub makeVisible()
		  BGLeft.Visible = true
		  BGRight.Visible = true
		  Foreground.Visible = true
		  DayLabel.Visible = true
		  activate()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setDay(ii as integer)
		  DayLabel.Text = ii.ToText()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setHighlightColor(cc as color)
		  highlightColor = cc
		  highlightTint = getTint(highlightColor)
		  Foreground.BorderColor = highlightColor
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DayClickedOn(day as integer)
	#tag EndHook


	#tag Property, Flags = &h21
		Private highlightColor As color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private highlightTint As color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private isActive As boolean = true
	#tag EndProperty


	#tag Constant, Name = kActiveTextColor, Type = Color, Dynamic = False, Default = \"&c000002", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kBgColor, Type = Color, Dynamic = False, Default = \"&cFFFFFF", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kInActiveTextColor, Type = Color, Dynamic = False, Default = \"&cA1A199", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events DayLabel
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if isActive then
		    RaiseEvent DayClickedOn(val(me.text))
		    
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  if isActive then
		    Foreground.BorderWidth = 1
		    
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  if isActive then
		    Foreground.BorderWidth = 0
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UseFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
#tag EndViewBehavior
