proc Calculate {a b} {
    if {[regexp {^[0-9]+$} $a] && [regexp {^[0-9]+$} $b]}  { ;# data validation
        global LABEL_TEXT1
        set ans [expr $a+$b]
        set LABEL_TEXT1 "Answer: $ans"
        .label04 configure -foreground green
        
    } else {
        global LABEL_TEXT1
        set LABEL_TEXT1 "Numbers only!" 
        .label04 configure -foreground red
    }
}

package require Tk
wm geometry . 350x300
wm title . "App"

label .label01 -text "Number 1: "
label .label02 -text "Number 2: "
label .label03 -text "Calculator Program" 
label .label04 -text "Answer: " -textvariable LABEL_TEXT1
entry .entry01 -textvariable TEXTBOX2_TEXT
entry .entry02 -textvariable TEXTBOX1_TEXT
button .button01 -text "Sum" -width 10 -command {Calculate $TEXTBOX1_TEXT $TEXTBOX2_TEXT}

# using grid to arrange widgets
grid configure .label01 -column 1 -row 2 -padx 10 -pady 10
grid configure .label02 -column 1 -row 3 -padx 10 -pady 10
grid configure .label03 -column 1 -row 1 -columnspan 2 
grid configure .label04  -column 2 -row 5
grid configure .entry01 -column 2 -row 2 -padx 10 -pady 10
grid configure .entry02 -column 2 -row 3 -padx 10 -pady 10 
grid configure .button01 -column 2 -row 4 -sticky we