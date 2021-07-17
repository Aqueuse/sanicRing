    from strutils import Digits, parseInt
import osproc
import times, os
import typetraits


## surveiller l'heure
## quand il est une certaine heure, déclencher la sonnerie

## sonnerie = filePath
## hour = hour to declench the ring
## minutes = minutes to declench the ring
## duration = duration in seconds of the ring repetition

proc ring(sonneriePath : string, hour: int, minutes : int, duration: int) =

    while true:
        # check the hour and minute
        let datetime = now()
        let nowHour = datetime.hour
        let nowMinutes = datetime.minute

        sleep(5000)

        if nowHour == hour and nowMinutes == minutes :
            echo "it's time !"
            let sonicRing = execCmd("mpg321 -q sonic_ring.mp3")



var arguments = commandLineParams()


## check if there is "--hour" and "--minutes" arguments
## if yes, get hour and minutes
## if no, echo help message

case len(arguments)
of 0:
    echo("usage : --hour 12 --minutes 45")
    discard
of 1:
    if arguments[0] == "--help":
        echo("usage : ring --hour 12 --minutes 45")
        discard
of 4:
    if arguments[0] == "--hour" and arguments[2] == "--minutes":
        let hour = parseInt(arguments[1])
        let minutes = parseInt(arguments[3])
        ring("pouet", hour, minutes, 25)
else:
    echo("usage : ring --hour 12 --minutes 45")

