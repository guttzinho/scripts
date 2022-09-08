#!/bin/bash

temp=" "
wind=" "
suncloudrain=" "
sun=" "
rain=" "
snow=" "
suncloud=" "
fog=" "
cloud=" "
storm=" "
lightning=" "
unknown=" "

location="RioVerdeGO"
errorWait=( 5 15 60 150 300 )
maxErrors=${#errorWait[@]}


function getWeather() {
    weather=$(curl -s "http://wttr.in/$location?format=1" 2>&1 | sed "s/🌡/$temp/g; s/🌬/$wind/g; s/↓|↙|←|↖|↑|↗|→|↘//g; s/🌦/$suncloudrain/g; s/☀/$sun/g; s/ 🌧|🌧|🌨|🌨|🌧|🌧/$rain/g; s/❄️/$snow/g; s/⛅️/$suncloud/g; s/🌫/$fog/g; s/☁️/$cloud/g; s/🌩/$lightning/g; s/⛈|⛈/$storm/; s/✨/$unknown/g")
}

function parseWeather() {
    for ((i = 0; i < maxErrors; i++)); do
        getWeather
        if [[ $weather != *"Unknown location"* ]]; then
            if [[ $weather != *"500 Internal Server Error"* ]]; then
                echo "$weather"
                break
            else
                sleep ${errorWait[$i]}
                errorCount=$((errorCount + 1))
            fi
        else
            echo ""
            break
        fi
    done
}

parseWeather
