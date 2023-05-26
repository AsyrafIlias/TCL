package require sqlite3
package require Tk
wm geometry . 1000x500
wm title . "Student's Record Application"
sqlite3 db database.dat

label .students -text "NAME" 
grid configure .students -column 1 -row 1 -sticky w -padx 10 
label .score -text "SCORE" 
grid configure .score -column 2 -row 1 -sticky w -padx 10 

set a 2
db eval "select * from students" {
    entry .name$a 
    .name$a insert 0 $name

    entry .score$a 
    .score$a insert 0 $score

    grid configure .name$a -column 1 -row $a -padx 10 -pady 2
    grid configure .score$a -column 2 -row $a -padx 10 -pady 2

    set a [expr $a+1]
}