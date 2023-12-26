#!/usr/bin/env python

import json
import requests
import string as str
from datetime import datetime

localization = {
    "en": {
        "feels_like": "Feels like",
        "wind": "Wind",
        "humidity": "Humidity",
        "today": "Today",
        "tomorrow": "Tomorrow",
        "weatherDesc": "weatherDesc",
        "chanceoffog": "Fog",
        "chanceoffrost": "Frost",
        "chanceofovercast": "Overcast",
        "chanceofrain": "Rain",
        "chanceofsnow": "Snow",
        "chanceofsunshine": "Sunshine",
        "chanceofthunder": "Thunder",
        "chanceofwindy": "Wind"
    },
    "ru": {
        "feels_like": "Чувствуется как",
        "wind": "Ветер",
        "humidity": "Влажность",
        "today": "Сегодня",
        "tomorrow": "Завтра",
        "day_after_tomorrow": "Послезавтра",
        "weatherDesc": "lang_ru",
        "chanceoffog": "Туман",
        "chanceoffrost": "Мороз",
        "chanceofovercast": "Пасмурная погода",
        "chanceofrain": "Дождь",
        "chanceofsnow": "Снег",
        "chanceofsunshine": "Ясный",
        "chanceofthunder": "Гром",
        "chanceofwindy": "Ветренный"
    }
}

lang = "ru"
text = localization[lang]

WEATHER_CODES = {
    '113': '☀️',
    '116': '⛅️',
    '119': '☁️',
    '122': '☁️',
    '143': '🌫',
    '176': '🌦',
    '179': '🌧',
    '182': '🌧',
    '185': '🌧',
    '200': '⛈',
    '227': '🌨',
    '230': '❄️',
    '248': '🌫',
    '260': '🌫',
    '263': '🌦',
    '266': '🌦',
    '281': '🌧',
    '284': '🌧',
    '293': '🌦',
    '296': '🌦',
    '299': '🌧',
    '302': '🌧',
    '305': '🌧',
    '308': '🌧',
    '311': '🌧',
    '314': '🌧',
    '317': '🌧',
    '320': '🌨',
    '323': '🌨',
    '326': '🌨',
    '329': '❄️',
    '332': '❄️',
    '335': '❄️',
    '338': '❄️',
    '350': '🌧',
    '353': '🌦',
    '356': '🌧',
    '359': '🌧',
    '362': '🌧',
    '365': '🌧',
    '368': '🌨',
    '371': '❄️',
    '374': '🌧',
    '377': '🌧',
    '386': '⛈',
    '389': '🌩',
    '392': '⛈',
    '395': '❄️'
}

data = {}


weather = requests.get(f"https://{lang}.wttr.in/?format=j1").json()


def format_time(time):
    return time.replace("00", "").zfill(2)


def format_temp(temp):
    return (hour['FeelsLikeC']+"°").ljust(3)

def format_event(event):
    return chances[event]+" "+hour[event]+"%"

def format_chances(hour):
    chances = [
        "chanceoffog",
        "chanceoffrost",
        "chanceofovercast",
        "chanceofrain",
        "chanceofsnow",
        "chanceofsunshine",
        "chanceofthunder",
        "chanceofwindy"
    ]

    probs = {text[e]: int(prob) for e, prob in hour.items() if e in chances and int(prob) > 0}
    sorted_probs = {e: probs[e] for e in sorted(probs, key=probs.get, reverse=True)}
    conditions = [f"{event} {prob}%" for event, prob in sorted_probs.items()]
    return ", ".join(conditions)

data['text'] = WEATHER_CODES[weather['current_condition'][0]['weatherCode']] + \
    " "+weather['current_condition'][0]['FeelsLikeC']+"°C"

weather_desc = text['weatherDesc']
data['tooltip'] = f"<b>{weather['current_condition'][0][weather_desc][0]['value']} {weather['current_condition'][0]['temp_C']}°</b>\n"
data['tooltip'] += f"{text['feels_like']}: {weather['current_condition'][0]['FeelsLikeC']}°\n"
data['tooltip'] += f"{text['wind']}: {weather['current_condition'][0]['windspeedKmph']} Км/ч\n"
data['tooltip'] += f"{text['humidity']}: {weather['current_condition'][0]['humidity']}%\n"
for i, day in enumerate(weather['weather']):
    data['tooltip'] += f"\n<b>"
    if i == 0:
        data['tooltip'] += f"{text['today']}, "
    if i == 1:
        data['tooltip'] += f"{text['tomorrow']}, "
    if i == 2 and 'day_after_tomorrow' in text:
        data['tooltip'] += f"{text['day_after_tomorrow']}, "
    data['tooltip'] += f"{day['date']}</b>\n"
    data['tooltip'] += f"⬆️ {day['maxtempC']}° ⬇️ {day['mintempC']}° "
    data['tooltip'] += f"🌅 {day['astronomy'][0]['sunrise']} 🌇 {day['astronomy'][0]['sunset']}\n"
    for hour in day['hourly']:
        if i == 0:
            if int(format_time(hour['time'])) < datetime.now().hour-2:
                continue
        data['tooltip'] += f"{format_time(hour['time'])} {WEATHER_CODES[hour['weatherCode']]} {format_temp(hour['FeelsLikeC'])} {hour[weather_desc][0]['value']}, {format_chances(hour)}\n"


print(json.dumps(data))