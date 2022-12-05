package NHT.Group.restapi.service;

import NHT.Group.restapi.dto.WeatherDto;
import NHT.Group.restapi.mapper.WeatherMapper;
import NHT.Group.restapi.model.Weather;
import NHT.Group.restapi.repository.WeatherRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class WeatherService {
    final WeatherRepository weatherRepository;
    WeatherMapper weatherMapper;
    @Autowired
    public  WeatherService(WeatherRepository weatherRepository, WeatherMapper weatherMapper) {
        this.weatherRepository = weatherRepository;
        this.weatherMapper = weatherMapper;
    }
    public List<WeatherDto> findAll(){
        List<Weather> listEntity = weatherRepository.findAll();
        return weatherMapper.toDtos(listEntity);
    }
//    public List<WeatherDto> findByDate(String date){
//        return weatherMapper.toDtos(weatherRepository.findByDate(date));
//    }

}
