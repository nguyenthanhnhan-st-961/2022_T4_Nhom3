package NHT.Group.restapi.controller;

import NHT.Group.restapi.dto.WeatherDto;
import NHT.Group.restapi.service.WeatherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@RestController
@RequestMapping("/api/weather")
@CrossOrigin()
public class WeatherController {
    private final WeatherService weatherService;
    @Autowired
    public WeatherController(WeatherService weatherService) {
        this.weatherService = weatherService;
    }

    @GetMapping("/getAll")
    public List<WeatherDto> findAll() {
        List<WeatherDto> listWeather = weatherService.findAll();
        if (listWeather.isEmpty()) {
            ResponseEntity.notFound().build();
        }
        return listWeather;
    }
}
