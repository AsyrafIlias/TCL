package require sqlite3

puts -nonewline "enter database file name: "
flush stdout 
gets stdin dbfilename

sqlite3 db $dbfilename

db eval "create table if not exists students (name text, score int)"

puts -nonewline "Do you want to enter records or view record? 1- Enter 2- View: "
flush stdout
gets stdin choice

if {$choice == 1} {
    puts -nonewline "enter number of records: "
    flush stdout
    gets stdin num

    for {set x 1} {$x <= $num} {incr x} {
        puts -nonewline "enter student $x name: " 
        flush stdout
        gets stdin name

        puts -nonewline "enter student $x score: " 
        flush stdout
        gets stdin score
        
        db eval "insert into students values ('$name','$score')"
    }

    puts "Records entered!"
} else {

    db eval "select * from students" {
        set mark [expr $score / 10]
        set star [string repeat "*" $mark]
        puts [format "%-15s | %s " $name $star]
    }

    set h_record [db eval "select * from students order by score desc limit 1"]
    puts "highest score and scorer is: [lindex $h_record 1], [lindex $h_record 0]"

    set t_record [db eval "select sum(score), avg(score) from students"]
    puts "Sum score: [lindex $t_record 0]"
    puts "Average score: [lindex $t_record 1]"
}

db close