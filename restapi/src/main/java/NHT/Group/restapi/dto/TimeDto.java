package NHT.Group.restapi.dto;
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
public class TimeDto {
    private Long id;
    private String hour_time;
    private Integer hour;
    private Integer minute;
}
