package NHT.Group.restapi.mapper;
import NHT.Group.restapi.dto.WeatherDto;
import NHT.Group.restapi.model.Weather;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component("weatherMapper")
public class WeatherMapper implements IMapper<Weather, WeatherDto>{
    private final DateMapper dateMapper;
    private final ProvinceMapper provinceMapper;
private final TimeMapper timeMapper;
    @Autowired
    public WeatherMapper(DateMapper dateMapper, ProvinceMapper provinceMapper, TimeMapper timeMapper) {
        this.dateMapper = dateMapper;
        this.provinceMapper = provinceMapper;
        this.timeMapper = timeMapper;
    }

    @Override
    public Weather toEntity(WeatherDto dto) {
        if(dto==null) return null;
        return Weather.builder()
                .id(dto.getId())
                .province(provinceMapper.toEntity(dto.getProvince()))
                .weather_time(timeMapper.toEntity(dto.getWeather_time()))
                .date_weather(dateMapper.toEntity(dto.getDate_weather()))
                .temperature(dto.getTemperature())
                .description(dto.getDescription())
                .humidity(dto.getHumidity())
                .vision(dto.getVision())
                .wind(dto.getWind())
                .uv_index(dto.getUv_index())
                .air_quality(dto.getAir_quality())
                .expired_date(dto.getExpired_date())
                .expired_time(dto.getExpired_time())
                .build();
    }

    @Override
    public WeatherDto toDto(Weather entity) {
        if(entity==null) return null;
        return WeatherDto.builder()
                .id(entity.getId())
                .province(provinceMapper.toDto(entity.getProvince()))
                .weather_time(timeMapper.toDto(entity.getWeather_time()))
                .date_weather(dateMapper.toDto(entity.getDate_weather()))
                .temperature(entity.getTemperature())
                .description(entity.getDescription())
                .humidity(entity.getHumidity())
                .vision(entity.getVision())
                .wind(entity.getWind())
                .uv_index(entity.getUv_index())
                .air_quality(entity.getAir_quality())
                .expired_date(entity.getExpired_date())
                .expired_time(entity.getExpired_time())
                .build();
    }

    @Override
    public List<Weather> toEntities(List<WeatherDto> weatherDtos) {
        List<Weather> weathers = new ArrayList<>();
        for (WeatherDto weatherDto : weatherDtos) {
            weathers.add(toEntity(weatherDto));
        }
        return weathers;
    }

    @Override
    public List<WeatherDto> toDtos(List<Weather> entities) {
        List<WeatherDto> weatherDtos = new ArrayList<>();
        for (Weather weather : entities) {
            weatherDtos.add(toDto(weather));
        }
        return weatherDtos;
    }
}
