import pandas as pd
from datetime import datetime

dim_time = pd.DataFrame(columns=['id', 'hour', 'minute'])

day_hour =[]
for i in range(24):
    for j in range(60):
        hour_minute = str(i) + ':' + str(j)
        t = datetime.strptime(hour_minute, '%H:%M').time()
        day_hour.append(t.__str__())

for i in range(len(day_hour)):
    dim_time = pd.concat([dim_time ,pd.DataFrame([{'hour_mintue':day_hour[i], 'hour':day_hour[i].split(':')[0], 'minute':day_hour[i].split(':')[1]}])], ignore_index=True)


        