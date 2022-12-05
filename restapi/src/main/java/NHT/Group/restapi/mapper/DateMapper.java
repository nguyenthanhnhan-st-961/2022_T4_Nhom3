package NHT.Group.restapi.mapper;
import NHT.Group.restapi.dto.DateDto;
import org.springframework.stereotype.Component;
import NHT.Group.restapi.model.DateDim;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Component("dateMapper")
public class DateMapper  implements IMapper<DateDim, DateDto>{

    @Override
    public DateDim toEntity(DateDto dto) {
        if(dto == null) return null;
        return DateDim.builder()
                .id(dto.getId())
                .full_date(dto.getFull_date())
                .day_since_2005(dto.getDay_since_2005())
                .month_since_2005((dto.getMonth_since_2005()))
                .day_of_week(dto.getDay_of_week())
                .calendar_month(dto.getCalendar_month())
                .calendar_year(dto.getCalendar_year())
                .calendar_year_month(dto.getCalendar_year_month())
                .day_of_month(dto.getDay_of_month())
                .day_of_year(dto.getDay_of_year())
                .week_of_year_sunday(dto.getWeek_of_year_sunday())
                .year_week_sunday(dto.getYear_week_sunday())
                .week_sunday_start(dto.getWeek_sunday_start())
                .week_of_year_monday(dto.getWeek_of_year_monday())
                .year_week_monday(dto.getYear_week_monday())
                .week_monday_start(dto.getWeek_monday_start())
                .holiday(dto.getHoliday())
                .day_type(dto.getDay_type())
                .build();
    }

    @Override
    public DateDto toDto(DateDim entity) {
        if(entity == null) return null;
        return DateDto.builder()
         .id(entity.getId())
                .full_date(entity.getFull_date())
                .day_since_2005(entity.getDay_since_2005())
                .month_since_2005((entity.getMonth_since_2005()))
                .day_of_week(entity.getDay_of_week())
                .calendar_month(entity.getCalendar_month())
                .calendar_year(entity.getCalendar_year())
                .calendar_year_month(entity.getCalendar_year_month())
                .day_of_month(entity.getDay_of_month())
                .day_of_year(entity.getDay_of_year())
                .week_of_year_sunday(entity.getWeek_of_year_sunday())
                .year_week_sunday(entity.getYear_week_sunday())
                .week_sunday_start(entity.getWeek_sunday_start())
                .week_of_year_monday(entity.getWeek_of_year_monday())
                .year_week_monday(entity.getYear_week_monday())
                .week_monday_start(entity.getWeek_monday_start())
                .holiday(entity.getHoliday())
                .day_type(entity.getDay_type())
                .build();
    }

    @Override
    public List<DateDim> toEntities(List<DateDto> dateDtos) {
        List<DateDim> dates = new ArrayList<>();
        for(DateDto dateDto : dateDtos){
            dates.add(toEntity(dateDto));
        }
        return dates;
    }

    @Override
    public List<DateDto> toDtos(List<DateDim> entities) {
        List<DateDto> dateDtos = new ArrayList<>();
        for (DateDim entity : entities) {
            dateDtos.add(toDto(entity));
        }
        return dateDtos;
    }
}
