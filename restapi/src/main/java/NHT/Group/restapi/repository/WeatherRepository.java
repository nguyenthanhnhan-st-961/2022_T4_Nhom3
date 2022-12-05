package NHT.Group.restapi.repository;

import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.JpaRepository;
import NHT.Group.restapi.model.Weather;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import java.util.List;
import java.util.Optional;
@Repository
public interface WeatherRepository extends JpaRepository<Weather, Long> {
    @Query(value = "SELECT * FROM fact_weather WHERE id = ?1", nativeQuery = true)
    Optional<Weather>getWeather(Long id);

    @Query(value = "SELECT * FROM fact_weather f join dim_date d on f.id_date = d.id WHERE d.full_date = ?1", nativeQuery = true)
    List<Weather>findByDate(String date);
}
