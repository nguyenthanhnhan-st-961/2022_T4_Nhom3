package NHT.Group.restapi.dto;
import NHT.Group.restapi.model.DateDim;
import NHT.Group.restapi.model.Province;
import NHT.Group.restapi.model.Time;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class WeatherDto {
    public Long id;
    public ProvinceDto province;
    public TimeDto weather_time;
    public DateDto date_weather;
    public Integer temperature;
    public String description;
    public Integer humidity;
    public Integer vision;
    public Float wind;
    public Float uv_index;
    public String air_quality;
    private Integer expired_date;
    private Integer expired_time;
}
