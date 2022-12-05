package NHT.Group.restapi.mapper;

import org.springframework.stereotype.Component;
import NHT.Group.restapi.dto.TimeDto;
import NHT.Group.restapi.model.Time;
import java.util.ArrayList;
import java.util.List;
@Component("timeMapper")
public class TimeMapper implements IMapper<Time,TimeDto> {
    @Override
    public Time toEntity(TimeDto dto) {
        if (dto == null) return null;
        return Time.builder()
                .id(dto.getId())
                .hour_time(dto.getHour_time())
                .hour(dto.getHour())
                .minute(dto.getMinute())
                .build();
    }

    @Override
    public TimeDto toDto(Time entity) {
        if (entity == null) return null;
        return TimeDto.builder()
                .id(entity.getId())
                .hour_time(entity.getHour_time())
                .hour(entity.getHour())
                .minute(entity.getMinute())
                .build();
    }

    @Override
    public List<Time> toEntities(List<TimeDto> timeDtos) {
        List<Time> times = new ArrayList<>();
        for (TimeDto timeDto : timeDtos) {
            times.add(toEntity(timeDto));
        }
        return times;
    }

    @Override
    public List<TimeDto> toDtos(List<Time> entities) {
        List<TimeDto> timeDtos = new ArrayList<>();
        for (Time time : entities) {
            timeDtos.add(toDto(time));
        }
        return timeDtos;
    }
}
